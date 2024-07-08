#include "windowrect.h"
#include <QDebug>
#include <QEvent>
#include <QGridLayout>
#include <QMouseEvent>

#if defined(Q_OS_LINUX)
#include <X11/Xatom.h>
#include <X11/Xlib.h>
#endif

WindowRect::WindowRect(QWidget *parent)
    : QWidget(parent)
{
    qDebug() << "0000000";
    this->setWindowFlags(Qt::FramelessWindowHint);    // 去掉边框、标题栏
    this->setAttribute(Qt::WA_TranslucentBackground); // 背景透明
    this->setWindowFlags(this->windowFlags() | Qt::WindowStaysOnTopHint); // 设置顶级窗口，防止遮挡

    // 在当前窗口上增加一层QWidget，否则不会显示边框
    QGridLayout *gridLayout = new QGridLayout(this);
    gridLayout->setSpacing(0);
    gridLayout->setContentsMargins(0, 0, 0, 0);
    gridLayout->addWidget(new QWidget(), 0, 0, 1, 1);

    this->setStyleSheet(" background-color: rgba(58, 196, 255, 40); border: 2px solid rgba(58, "
                        "196, 255, 200);"); // 设置窗口边框样式 dashed虚线，solid 实线

    connect(MouseEvent::getInstance(), &MouseEvent::mouseSignal, this, &WindowRect::on_mouseSignal);
    // 使用定时器定时获取当前鼠标位置的窗口位置信息
    connect(&m_timer, &QTimer::timeout, this, &WindowRect::on_timeout);
    m_timer.start(200);
}

WindowRect::~WindowRect()
{
}

void WindowRect::on_mouseSignal(QEvent *event)
{
    delete event;
    this->hide();
    emit this->selectRect(QRect(this->pos(), this->size()));
}

void WindowRect::showEvent(QShowEvent *event)
{
    QWidget::showEvent(event);
}

void WindowRect::hideEvent(QHideEvent *event)
{
    QWidget::hideEvent(event);
}

void WindowRect::mousePressEvent(QMouseEvent *event)
{
    this->hide();
    emit this->selectRect(QRect(this->pos(), this->size()));
    QWidget::mousePressEvent(event);
}

void WindowRect::on_timeout()
{
    QPoint point = QCursor::pos(); // 获取鼠标当前位置

    // linux下使用x11获取的窗口大小有可能不太准确，例如浏览器的大小会偏小
    // 获取根窗口
    Display *display = XOpenDisplay(nullptr);
    Window rootWindow = DefaultRootWindow(display);

    Window root_return, parent_return;
    Window *children = nullptr;
    unsigned int nchildren = 0;
    // 函数详细说明见xlib文档：https://tronche.com/gui/x/xlib/window-information/XQueryTree.html
    // 该函数会返回父窗口的子窗口列表children，因为这里用的是当前桌面的根窗口作为父窗口，所以会返回所有子窗口
    // 注意：窗口顺序(z-order)为自底向上
    XQueryTree(display, rootWindow, &root_return, &parent_return, &children, &nchildren);

    QRect recte; // 保存鼠标当前所在窗口的范围
    for (unsigned int i = 0; i < nchildren; ++i) {
        if (children[i] == this->winId())
            continue; // 由于当前窗口一直在最顶层，所以这里要过滤掉当前窗口，否则一直获取到的就是当前窗口大小
        XWindowAttributes attrs;
        XGetWindowAttributes(display, children[i], &attrs); // 获取窗口参数
        if (attrs.map_state
            == IsViewable) // 只处理可见的窗口， 三个状态：IsUnmapped, IsUnviewable, IsViewable
        {
#if 0
            QRect rect(attrs.x + 1, attrs.y, attrs.width, attrs.height);  // 这里x+1防止全屏显示，如果不+1，设置的大小等于屏幕大小是会自动切换成全屏显示状态，后面就无法缩小了
#else
            QRect rect(attrs.x, attrs.y, attrs.width, attrs.height);
#endif
            if (rect.contains(point)) // 判断鼠标坐标是否在窗口范围内
            {
                recte = rect; // 记录最后一个窗口的范围
            }
        }
    }
#if 0 // 在linux下使用setGeometry设置窗口会有一些问题
    this->showNormal();               // 第一次显示是如果是屏幕大小，则后面无法缩小，这里需要设置还原
    this->setGeometry(recte);         // 设置窗口边框
#else // 使用setFixedSize+move可以避免这些问题
    this->move(recte.x(), recte.y());
    this->setFixedSize(recte.width(), recte.height());
#endif
    //    qDebug() << this->rect() <<recte<< this->windowState();

    // 注意释放资源
    XFree(children);
    XCloseDisplay(display);
}

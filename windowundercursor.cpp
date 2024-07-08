#include "windowundercursor.h"

WindowUnderCursor::WindowUnderCursor(QObject *parent)
    : QObject{parent}
{
    qDebug() << "222222";
    qDebug() << "777";
}

QImage WindowUnderCursor::captureWindowUnderCursor()

{
    qDebug() << "captureWindowUnderCursor";
    QPoint cursorPos = QCursor::pos();
    QWidget *widget = QApplication::widgetAt(cursorPos);
    if (!widget)
        qDebug() << "99999";
    return QImage();
    WId windowid = widget->winId();
    QScreen *screen = QGuiApplication::primaryScreen();

    // 获取窗口的几何位置
    QRect windowGeometry = widget->geometry();

    // 截取指定窗口的截图
    QPixmap screenshot = screen->grabWindow(windowid,
                                            windowGeometry.x(),
                                            windowGeometry.y(),
                                            windowGeometry.width(),
                                            windowGeometry.height());

    return screenshot.toImage();
}

void WindowUnderCursor::savecapture()
{
    ScreenshotManager *s = new ScreenshotManager(this);
    s->startListening();
    qDebug() << "savecapture";
    qDebug() << "";
    QImage image = captureWindowUnderCursor();
    if (image.isNull()) {
        qDebug() << "图像无效。";
    } else {
        qDebug() << "图像有效。";
    }
    // 假设你已经有一个 QImage 对象，名为 image
    QString filePath = "/root/1Qtbook/new/image.png";
    // 指定保存路径和文件名
    qDebug() << filePath;
    bool success = image.save(filePath, "PNG", 100);

    if (success) {
        qDebug() << "图像已成功保存到：" << filePath;
    } else {
        qDebug() << "保存图像失败。";
    }
    // s->stopListening();
}

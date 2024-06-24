#include "windowundercursor.h"

WindowUnderCursor::WindowUnderCursor() {}

QImage WindowUnderCursor::captureWindowUnderCursor()
{
    QPoint cursorPos = QCursor::pos();
    QWidget *widget = QApplication::widgetAt(cursorPos);
    if (!widget)
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

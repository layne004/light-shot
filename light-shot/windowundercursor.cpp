#include "windowundercursor.h"

WindowUnderCursor::WindowUnderCursor() {}

QImage WindowUnderCursor::captureWindowUnderCursor()
{
    QPoint cursorPos = QCursor::pos();
    QWindow *window = QApplication::windowAt(cursorPos);
    if (!window)
        return QImage();

    QScreen *screen = window->screen();
    if (!screen)
        return QImage();

    return screen->grabWindow(window->winId()).toImage();
}

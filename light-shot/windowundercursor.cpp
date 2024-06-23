#include "windowundercursor.h"

WindowUnderCursor::WindowUnderCursor() {}

QImage WindowUnderCursor::captureWindowUnderCursor()
{
    QPoint cursorPos = QCursor::pos();
    QWindow *window = QApplication::windowAt(cursorPos);
    if (!window)
        return QImage(); // No window found

    QScreen *screen = window->screen();
    if (!screen)
        return QImage(); // No screen found

    return screen->grabWindow(window->winId()).toImage();
}

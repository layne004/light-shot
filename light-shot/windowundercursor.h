#pragma once
#include <QApplication>
#include <QCursor>
#include <QQuickItem>
#include <QScreen>
#include <QWindow>
#include <qqmlregistration.h>

class WindowUnderCursor
{
    QML_ELEMENT

public:
    WindowUnderCursor();

    QImage captureWindowUnderCursor()
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
};

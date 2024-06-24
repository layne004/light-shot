#pragma once
#include <QApplication>
#include <QCursor>
#include <QObject>
#include <QQuickItem>
#include <QScreen>
#include <QWidget>
#include <QWindow>

#include <qqmlregistration.h>
class WindowUnderCursor : QObject
{
    QML_ELEMENT

public:
    WindowUnderCursor();

    QImage captureWindowUnderCursor();
    void saveundercursor(QImage image);
};

#pragma once
#include <QApplication>
#include <QCursor>
#include <QObject>
#include <QQuickItem>
#include <QScreen>
#include <QWidget>
#include <QWindow>

#include <qqmlregistration.h>
class WindowUnderCursor : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit WindowUnderCursor(QObject *parent = nullptr);

    Q_INVOKABLE QImage captureWindowUnderCursor();
    Q_INVOKABLE void savecapture();
};

#pragma once

#include <QApplication>
#include <QDateTime>
#include <QDebug>
#include <QObject>
#include <QPixmap>
#include <QScreen>
#include <xcb/xcb.h>
#include <xcb/xcb_util.h>

class ScreenshotManager : public QObject
{
    Q_OBJECT

public:
    explicit ScreenshotManager(QObject *parent = nullptr)
        : QObject(parent)
    {}

    void startListening();

    void stopListening();

protected:
    virtual bool nativeEventFilter(const QByteArray &eventType,
                                   void *message,
                                   qintptr *result) override;

signals:
    void mouseClicked();
};

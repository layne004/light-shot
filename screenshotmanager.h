
#include <QAbstractNativeEventFilter>
#include <QApplication>
#include <QDateTime>
#include <QDebug>
#include <QObject>
#include <QPixmap>
#include <QScreen>
#include <xcb/xcb.h>
#include <xcb/xcb_util.h>

class ScreenshotManager : public QObject, public QAbstractNativeEventFilter
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

private:
    xcb_connection_t *display;
    xcb_window_t rootWindow;
};

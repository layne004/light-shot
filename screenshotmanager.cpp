#include "screenshotmanager.h"

void ScreenshotManager::startListening()
{
    qDebug() << "startlistening";
    display = xcb_connect(nullptr, nullptr);
    if (!display) {
        qDebug() << "Cannot open display";
        return;
    }

    xcb_screen_t *screen = xcb_setup_roots_iterator(xcb_get_setup(display)).data;
    rootWindow = screen->root;

    xcb_grab_pointer(display,
                     0,
                     rootWindow,
                     XCB_EVENT_MASK_BUTTON_PRESS,
                     XCB_GRAB_MODE_ASYNC,
                     XCB_GRAB_MODE_ASYNC,
                     rootWindow,
                     XCB_NONE,
                     XCB_CURRENT_TIME);

    xcb_grab_keyboard(display,
                      0,
                      rootWindow,
                      XCB_CURRENT_TIME,
                      XCB_GRAB_MODE_ASYNC,
                      XCB_GRAB_MODE_ASYNC);

    xcb_flush(display);

    qApp->installNativeEventFilter(this);
}

void ScreenshotManager::stopListening()
{
    xcb_ungrab_pointer(display, XCB_CURRENT_TIME);
    xcb_ungrab_keyboard(display, XCB_CURRENT_TIME);

    xcb_flush(display);
    qApp->removeNativeEventFilter(this);
    xcb_disconnect(display);
}

bool ScreenshotManager::nativeEventFilter(const QByteArray &eventType,
                                          void *message,
                                          qintptr *result)
{
    qDebug() << "startnativeeventfilter";
    qDebug() << eventType;
    if (eventType == "xcb_generic_event_t") {
        qDebug() << "in,xcb_generic_event_t";
        xcb_generic_event_t *event = static_cast<xcb_generic_event_t *>(message);
        //if ((event->response_type & ~0x80) == XCB_BUTTON_PRESS) {
        qDebug() << "startnativeeventfilter___first_if";
        xcb_button_press_event_t *bp = reinterpret_cast<xcb_button_press_event_t *>(event);
        QPoint globalPos(bp->root_x, bp->root_y);

        QScreen *screen = QGuiApplication::primaryScreen();
        if (screen) {
            qDebug() << "startnativeeventfilter___second_if";
            QPixmap screenshot = screen->grabWindow(rootWindow);
            QString filePath = QString("screenshot_%1.png")
                                   .arg(QDateTime::currentDateTime().toString("yyyyMMdd_HHmmss"));
            if (screenshot.save(filePath)) {
                qDebug() << "Screenshot saved to" << filePath;
            } else {
                qDebug() << "Failed to save screenshot";
            }
        }
        stopListening();
        emit mouseClicked();
        return true;
        // }
    }
    stopListening();
    return false;
}

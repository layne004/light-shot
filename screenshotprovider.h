/*
 * author: CaiJiali
 * date: 2024.06.21
 * ScreenshotProvider: provide screenshot for mainwindow
 */
#pragma once

#include <QQuickImageProvider>
#include <QScreen>

class ScreenshotProvider : public QQuickImageProvider
{
public:
    ScreenshotProvider()
        : QQuickImageProvider{QQuickImageProvider::Image}
    {}

    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override
    {
        // get main screen
        QScreen *screen;
        screen = QGuiApplication::primaryScreen();

        if (!screen)
            return QImage{};

        QPixmap pixmap = screen->grabWindow(0);
        QImage screenshot = pixmap.toImage();

        return screenshot;
    }
};

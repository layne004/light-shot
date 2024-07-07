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
        if (m_imageCache.contains(id)) {
            QImage img = m_imageCache.value(id);
            if (size)
                *size = img.size();
            return img;
        }

        // get main screen
        QScreen *screen;
        screen = QGuiApplication::primaryScreen();

        if (!screen)
            return QImage{};

        QImage screenshot = screen->grabWindow(0).toImage();

        if (size) //如果需要知道图像大小
            *size = screenshot.size();

        m_imageCache.insert(id, screenshot);

        return screenshot;
    }

    QImage getFromCache(QString &id) { return m_imageCache.value(id); }

private:
    QHash<QString, QImage> m_imageCache;
};

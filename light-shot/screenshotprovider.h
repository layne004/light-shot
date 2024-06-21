/*
 * author: CaiJiali
 * date: 2024.06.21
 * ScreenshotProvider: provide screenshot for mainwindow
 */

#pragma once

#include <QQuickImageProvider>

class ScreenshotProvider : public QQuickImageProvider
{
public:
    ScreenshotProvider();

    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
};

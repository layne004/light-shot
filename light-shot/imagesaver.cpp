#include "imagesaver.h"
#include <QClipboard>
#include <QImage>
#include <QMargins>
#include <QPixmap>
#include <QQuickItemGrabResult>
#include <QScreen>
#include <QSharedPointer>

ImageSaver::ImageSaver(QObject *parent)
    : QObject{parent}
{}

void ImageSaver::saveImage(QQuickItem *item, QRect area, QString filepath)
{
    // //QSharedPointer<QQuickItemGrabResult> QQuickItem::grabToImage()
    QSharedPointer<const QQuickItemGrabResult> grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug("Failed to grab");
        exit(EXIT_FAILURE);
    }

    qDebug() << filepath;
    // connect 防止grab还未完成就开始下一步操作
    if (area.isEmpty())
        connect(grabResult.data(), &QQuickItemGrabResult::ready, [=]() {
            if (!grabResult->saveToFile(filepath))
                qDebug() << "failed to save";
        });
    else {
        area -= QMargins{2, 2, 2, 2}; //剪掉border.width
        connect(grabResult.data(), &QQuickItemGrabResult::ready, [=]() {
            QImage clipedImage = grabResult->image().copy(area);

            clipedImage.save(filepath);
        });
    }
}

void ImageSaver::saveScreenshot(QRect clip, QString filename)
{
    QScreen *screen = QGuiApplication::primaryScreen();
    if (!screen)
        qDebug() << "Failed to get screen!";
    else {
        // get pixmap info
        QPixmap pixmap = screen->grabWindow(0);
        if (!pixmap)
            qDebug() << "Failed to get pixmap!";

        if (clip.isEmpty())
            pixmap.save(filename);
        else {
            clip -= QMargins{2, 2, 2, 2};
            QPixmap clipScreenshot = pixmap.copy(clip);
            clipScreenshot.save(filename);
        }
    }
}

void ImageSaver::saveImageToClip(QQuickItem *item, QRect area)
{
    QSharedPointer<const QQuickItemGrabResult> grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug() << "Failed to grab";
        exit(EXIT_FAILURE);
    }

    if (!area.isEmpty())
        area -= QMargins{2, 2, 2, 2};

    QClipboard *clipboard;
    QImage grabImg;
    QImage final;
    connect(grabResult.data(), &QQuickItemGrabResult::ready, [&]() {
        grabImg = grabResult->image();
        if (grabImg.isNull()) {
            qDebug() << "Failed to convert grabResult to QImage.";
            exit(EXIT_FAILURE);
        }

        if (area.isEmpty())
            final = grabImg;
        else
            final = grabImg.copy(area);

        clipboard = QGuiApplication::clipboard();
        if (clipboard)
            clipboard->setImage(final);
        else
            qDebug() << "Failed to get clipboard.\n";
    });
}

void ImageSaver::saveScreenshotToClip(QRect area)
{
    auto screen = QGuiApplication::primaryScreen();
    QPixmap pixmap;
    if (area.isEmpty())
        pixmap = screen->grabWindow(0);
    else {
        area -= QMargins{2, 2, 2, 2}; //剪掉border.width
        pixmap = screen->grabWindow(0, area.x(), area.y(), area.width(), area.height());
    }

    QClipboard *clipboard = QGuiApplication::clipboard();
    if (clipboard)
        clipboard->setPixmap(pixmap);
    else
        qDebug() << "Failed to get clipboard.\n";
}

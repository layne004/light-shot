#include "imagesaver.h"
#include <QQuickItemGrabResult>
#include <QSharedPointer>

ImageSaver::ImageSaver(QObject *parent)
    : QObject{parent}
{}

void ImageSaver::save(QQuickItem *item, QString filepath)
{
    //QSharedPointer<QQuickItemGrabResult> QQuickItem::grabToImage()
    QSharedPointer<const QQuickItemGrabResult> grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug("Failed to grab");
    }

    connect(grabResult.data(), &QQuickItemGrabResult::ready, [=]() {
        grabResult->saveToFile(filepath);
    });
    qDebug() << "save successfully!";
}

/*
    author  :Hecuiying
    date    :2024.06.20
    purpose :接受来自IrregularWindow的数据进行不规则形状的截图
*/

#include "irregularshot.h"
#include <QDir>
#include <QImage>
#include <QPainter>
#include <QQuickItemGrabResult>
#include <QSharedPointer>

IrregularShot::IrregularShot(QObject *parent)
    : QObject{parent}
{
    // connect(timer, &QTimer::timeout, this, &IrregularShot::checkGrabResult);
}

void IrregularShot::capture(QQuickItem *item, const QVariantList &polygon)
{
    qPolygon.clear();
    for (const QVariant &point : polygon) {
        QVariantMap pointMap = point.toMap();
        qPolygon << QPoint(pointMap["x"].toInt(), pointMap["y"].toInt());
    }

    qDebug() << "the function has been used.";

    grabResult = item->grabToImage();

    qDebug() << "Grab result requested.";

    if (!grabResult) {
        qDebug() << "Failed tp grab";
        return;
    }

    qDebug() << "Grab result obtained.";
    qDebug() << "grabResult.data() is:" << grabResult.data();

    qDebug() << "grab result ready.";
    QImage grabbedImage = grabResult->image();

    if (grabbedImage.isNull()) {
        qDebug() << "Failed to grab image";
        return;
    }

    QImage resultImage(grabbedImage.size(), QImage::Format_ARGB32);
    resultImage.fill(Qt::yellow);

    QPainter painter(&resultImage);
    painter.setClipRegion(QRegion(qPolygon));
    painter.drawImage(0, 0, grabbedImage);
    painter.end();

    QString filepath = QDir::temp().absoluteFilePath("irregular_screenshot.png");
    if (resultImage.save(filepath)) {
        qDebug() << "Irregular region saved successfully";
    } else {
        qDebug() << "Failed to save the image";
    }

    emit screenshotCaptured(filepath);
}

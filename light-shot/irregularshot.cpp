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
{}

void IrregularShot::capture(QQuickItem *item, const QVariantList &polygon)
{
    QPolygon qPolygon;
    for (const QVariant &point : polygon) {
        QVariantMap pointMap = point.toMap();
        qPolygon << QPoint(pointMap["x"].toInt(), pointMap["y"].toInt());
    }

    QSharedPointer<const QQuickItemGrabResult> grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug() << "Failed tp grab";
        return;
    }

    connect(grabResult.data(), &QQuickItemGrabResult::ready, [=]() {
        QImage grabbedImage = grabResult->image();
        QImage resultImage(grabbedImage.size(), QImage::Format_ARGB32);
        resultImage.fill(Qt::transparent);

        QPainter painter(&resultImage);
        painter.setClipRegion(QRegion(qPolygon));
        painter.drawImage(0, 0, grabbedImage);
        painter.end();

        QString filepath = QDir::temp().absoluteFilePath("irregular_screenshot.png");
        resultImage.save(filepath);

        emit screenshotCaptured(filepath);
        qDebug() << "Irregular region saved successfully";
    });
}

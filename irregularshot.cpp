/*
    author  :Hecuiying
    date    :2024.06.20
    purpose :接受来自IrregularWindow的数据进行不规则形状的截图
*/

#include "irregularshot.h"
#include <QDir>
#include <QEventLoop>
#include <QImage>
#include <QPainter>
#include <QQuickItemGrabResult>
#include <QSharedPointer>

IrregularShot::IrregularShot(QObject *parent)
    : QObject{parent}
{
    // connect(timer, &QTimer::timeout, this, &IrregularShot::checkGrabResult);
}

QString IrregularShot::capture(QQuickItem *item, const QVariantList &polygon)
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
        EXIT_FAILURE;
    }

    qDebug() << "Grab result obtained.";
    qDebug() << "grabResult.data() is:" << grabResult.data();

    //使用事件循环阻塞等待grabResult准备就绪
    QEventLoop loop;
    connect(grabResult.data(), &QQuickItemGrabResult::ready, &loop, &QEventLoop::quit);
    loop.exec();

    qDebug() << "grab result ready.";
    QImage grabbedImage = grabResult->image();
    qDebug() << "grabbedImage is:" << grabbedImage;

    if (grabbedImage.isNull()) {
        qDebug() << "Failed to grab image";
        EXIT_FAILURE;
    }
    qDebug() << "grabbedImage.size is" << grabbedImage.size();

    //创建一个新图像绘制不规则形状
    //创建一个新的空白图像，再次图像上绘制不规则形状
    QImage resultImage(grabbedImage.size(), QImage::Format_ARGB32);
    resultImage.fill(Qt::transparent);

    //设置绘图环境
    QPainter painter(&resultImage);
    painter.setClipRegion(QRegion(qPolygon));
    painter.drawImage(0, 0, grabbedImage);
    painter.end();

    qDebug() << "resultImage is " << resultImage;

    QString filepath = QDir::temp().absoluteFilePath("irregular_screenshot.png");
    if (resultImage.save(filepath)) {
        qDebug() << "filepath is:" << filepath;
        qDebug() << "Irregular region saved successfully";
    } else {
        qDebug() << "Failed to save the image";
    }

    return filepath;
}

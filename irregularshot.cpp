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
#include "globalvalues.h"

IrregularShot::IrregularShot(QObject *parent)
    : QObject{parent}
{}

void IrregularShot::capture(QQuickItem *item, const QVariantList &polygon)
{
    //类型转换，将qml端的坐标数据转为多边形QPolygon
    qPolygon.clear();
    for (const QVariant &point : polygon) {
        QVariantMap pointMap = point.toMap();
        qPolygon << QPoint(pointMap["x"].toInt(), pointMap["y"].toInt());
    }

    grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug() << "Failed tp grab";
        EXIT_FAILURE;
    }

    //使用事件循环阻塞等待grabResult准备就绪
    QEventLoop loop;
    connect(grabResult.data(), &QQuickItemGrabResult::ready, &loop, &QEventLoop::quit);
    loop.exec();

    QImage grabbedImage = grabResult->image();

    if (grabbedImage.isNull()) {
        qDebug() << "Failed to grab image";
        EXIT_FAILURE;
    }

    //创建一个新图像绘制不规则形状
    //创建一个新的空白图像，再次图像上绘制不规则形状
    QImage resultImage(grabbedImage.size(), QImage::Format_ARGB32);
    resultImage.fill(Qt::transparent);

    QRegion clipRegion(qPolygon);

    //设置绘图环境
    QPainter painter(&resultImage);
    painter.setClipRegion(clipRegion);
    painter.drawImage(0, 0, grabbedImage);
    painter.end();

    m_tempPath = QDir::temp().absoluteFilePath(GlobalValues::time());
    if (resultImage.save(m_tempPath)) {
        qDebug() << "filepath is:" << m_tempPath;
        qDebug() << "Irregular region saved successfully";
    } else {
        qDebug() << "Failed to save the image";
    }
}

QString IrregularShot::getTempPath() const
{
    return m_tempPath;
}

void IrregularShot::setTempPath(const QString &newTempPath)
{
    if (m_tempPath == newTempPath)
        return;
    m_tempPath = newTempPath;
    emit tempPathChanged();
}

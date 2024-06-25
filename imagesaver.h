/*
 * author: CaiJiali
 * date: 2024.06.22
 * ImageSaver: provider the method of saving Image
 * note: 'save' method will save in the way of item's original size
 */
#pragma once

#include <QObject>
#include <QQuickItem>
#include "globalvalues.h"
#include <qqmlregistration.h>

class ImageSaver : public QObject
{
    Q_OBJECT

    QML_ELEMENT
public:
    explicit ImageSaver(QObject *parent = nullptr);
   
    //可以将qml端的'Image对象'保存成图片至本地, 默认全屏，也可矩形区域裁剪; 默认时间命名，也可自定义命名
    Q_INVOKABLE void saveImage(QQuickItem *item,
                               QRect area = QRect(),
                               QString filepath = GlobalValues::filePath());

    //重新截图并保存本地，可指定区域裁剪和自定义命名
    Q_INVOKABLE void saveScreenshot(QRect clip = QRect(),
                                    QString filename = GlobalValues::filePath());
    //tofix
    //将qml端的'Image对象'至'剪切板',默认是全部，可指定矩形区域裁剪
    Q_INVOKABLE void saveImageToClip(QQuickItem *item, QRect area = QRect());

    //重新截图并保存至剪切板，可指定区域裁剪
    Q_INVOKABLE void saveScreenshotToClip(QRect area = QRect());

    QString getTempPath() const;
    void setTempPath(const QString &newTempPath);

signals:
    void tempPathChanged();

private:
    QString m_tempPath;
    Q_PROPERTY(QString tempPath READ getTempPath WRITE setTempPath NOTIFY tempPathChanged FINAL)
};

/*
 * author: CaiJiali
 * date: 2024.06.22
 * ImageSaver: provider the method of saving Image
 * note: 'save' method will save in the way of item's original size
 */
#pragma once

#include <QObject>
#include <QQuickItem>
#include <qqmlregistration.h>

class ImageSaver : public QObject
{
    Q_OBJECT

    QML_ELEMENT
public:
    explicit ImageSaver(QObject *parent = nullptr);

    Q_INVOKABLE void save(QQuickItem *item, QString filepath);
};

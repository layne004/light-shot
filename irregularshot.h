/*
    author  :Hecuiying
    date    :2024.06.20
*/

#pragma once

#include <QObject>
#include <QPolygon>
#include <QQuickItem>
#include <QQuickItemGrabResult>
#include <QSharedPointer>
#include <QTimer>
#include <QVariantList>
#include <qqmlregistration.h>

class IrregularShot : public QObject
{
    Q_OBJECT

    QML_ELEMENT
public:
    explicit IrregularShot(QObject *parent = nullptr);

    Q_INVOKABLE QString capture(QQuickItem *item, const QVariantList &polygon);

private:
    QSharedPointer<const QQuickItemGrabResult> grabResult;

    QPolygon qPolygon;
};

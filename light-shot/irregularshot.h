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

    Q_INVOKABLE void capture(QQuickItem *item, const QVariantList &polygon);

signals:
    void screenshotCaptured(const QString &filepath);
    // private slots:
    //     void processGrabResult();

private:
    QSharedPointer<const QQuickItemGrabResult> grabResult;
    // QTimer *timer;
    QPolygon qPolygon;
};

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
    Q_PROPERTY(QString tempPath READ getTempPath WRITE setTempPath NOTIFY tempPathChanged FINAL)
    QML_ELEMENT
public:
    explicit IrregularShot(QObject *parent = nullptr);

    Q_INVOKABLE void capture(QQuickItem *item, const QVariantList &polygon);

    QString getTempPath() const;
    void setTempPath(const QString &newTempPath);

signals:
    void tempPathChanged();

private:
    QSharedPointer<const QQuickItemGrabResult> grabResult;
    QPolygon qPolygon;
    QString m_tempPath;
};

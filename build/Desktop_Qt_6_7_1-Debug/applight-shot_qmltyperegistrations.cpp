/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#include <imagesaver.h>
#include <windowundercursor.h>


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_lightshot()
{
    qmlRegisterTypesAndRevisions<ImageSaver>("lightshot", 1);
    qmlRegisterTypesAndRevisions<WindowUnderCursor>("lightshot", 1);
    qmlRegisterModule("lightshot", 1, 0);
}

static const QQmlModuleRegistration lightshotRegistration("lightshot", qml_register_types_lightshot);

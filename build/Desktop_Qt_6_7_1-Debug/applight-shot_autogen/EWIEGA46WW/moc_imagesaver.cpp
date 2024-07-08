/****************************************************************************
** Meta object code from reading C++ file 'imagesaver.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.7.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../imagesaver.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'imagesaver.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.7.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSImageSaverENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSImageSaverENDCLASS = QtMocHelpers::stringData(
    "ImageSaver",
    "QML.Element",
    "auto",
    "tempPathChanged",
    "",
    "saveImage",
    "QQuickItem*",
    "item",
    "area",
    "filepath",
    "saveScreenshot",
    "clip",
    "filename",
    "saveImageToClip",
    "saveScreenshotToClip",
    "tempPath"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSImageSaverENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       1,   14, // classinfo
      11,   16, // methods
       1,  119, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       3,    0,   82,    4, 0x06,    2 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       5,    3,   83,    4, 0x02,    3 /* Public */,
       5,    2,   90,    4, 0x22,    7 /* Public | MethodCloned */,
       5,    1,   95,    4, 0x22,   10 /* Public | MethodCloned */,
      10,    2,   98,    4, 0x02,   12 /* Public */,
      10,    1,  103,    4, 0x22,   15 /* Public | MethodCloned */,
      10,    0,  106,    4, 0x22,   17 /* Public | MethodCloned */,
      13,    2,  107,    4, 0x02,   18 /* Public */,
      13,    1,  112,    4, 0x22,   21 /* Public | MethodCloned */,
      14,    1,  115,    4, 0x02,   23 /* Public */,
      14,    0,  118,    4, 0x22,   25 /* Public | MethodCloned */,

 // signals: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 6, QMetaType::QRect, QMetaType::QString,    7,    8,    9,
    QMetaType::Void, 0x80000000 | 6, QMetaType::QRect,    7,    8,
    QMetaType::Void, 0x80000000 | 6,    7,
    QMetaType::Void, QMetaType::QRect, QMetaType::QString,   11,   12,
    QMetaType::Void, QMetaType::QRect,   11,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 6, QMetaType::QRect,    7,    8,
    QMetaType::Void, 0x80000000 | 6,    7,
    QMetaType::Void, QMetaType::QRect,    8,
    QMetaType::Void,

 // properties: name, type, flags
      15, QMetaType::QString, 0x00015903, uint(0), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject ImageSaver::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSImageSaverENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSImageSaverENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_metaTypeArray<
        // property 'tempPath'
        QString,
        // Q_OBJECT / Q_GADGET
        ImageSaver,
        // method 'tempPathChanged'
        void,
        // method 'saveImage'
        void,
        QQuickItem *,
        QRect,
        QString,
        // method 'saveImage'
        void,
        QQuickItem *,
        QRect,
        // method 'saveImage'
        void,
        QQuickItem *,
        // method 'saveScreenshot'
        void,
        QRect,
        QString,
        // method 'saveScreenshot'
        void,
        QRect,
        // method 'saveScreenshot'
        void,
        // method 'saveImageToClip'
        void,
        QQuickItem *,
        QRect,
        // method 'saveImageToClip'
        void,
        QQuickItem *,
        // method 'saveScreenshotToClip'
        void,
        QRect,
        // method 'saveScreenshotToClip'
        void
    >,
    nullptr
} };

void ImageSaver::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ImageSaver *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->tempPathChanged(); break;
        case 1: _t->saveImage((*reinterpret_cast< std::add_pointer_t<QQuickItem*>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QRect>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[3]))); break;
        case 2: _t->saveImage((*reinterpret_cast< std::add_pointer_t<QQuickItem*>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QRect>>(_a[2]))); break;
        case 3: _t->saveImage((*reinterpret_cast< std::add_pointer_t<QQuickItem*>>(_a[1]))); break;
        case 4: _t->saveScreenshot((*reinterpret_cast< std::add_pointer_t<QRect>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        case 5: _t->saveScreenshot((*reinterpret_cast< std::add_pointer_t<QRect>>(_a[1]))); break;
        case 6: _t->saveScreenshot(); break;
        case 7: _t->saveImageToClip((*reinterpret_cast< std::add_pointer_t<QQuickItem*>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QRect>>(_a[2]))); break;
        case 8: _t->saveImageToClip((*reinterpret_cast< std::add_pointer_t<QQuickItem*>>(_a[1]))); break;
        case 9: _t->saveScreenshotToClip((*reinterpret_cast< std::add_pointer_t<QRect>>(_a[1]))); break;
        case 10: _t->saveScreenshotToClip(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickItem* >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickItem* >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickItem* >(); break;
            }
            break;
        case 7:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickItem* >(); break;
            }
            break;
        case 8:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickItem* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ImageSaver::*)();
            if (_t _q_method = &ImageSaver::tempPathChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<ImageSaver *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->getTempPath(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<ImageSaver *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTempPath(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *ImageSaver::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ImageSaver::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSImageSaverENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ImageSaver::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void ImageSaver::tempPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP

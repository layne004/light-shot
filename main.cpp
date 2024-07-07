#include <QGuiApplication>
#include <QQmlApplicationEngine>
// #include <QQuickWindow>
#include "screenshotprovider.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImageProvider("screenshot", new ScreenshotProvider);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("lightshot", "MainWindow");

    // QObject *rootObj = engine.rootObjects().first();
    // QQuickWindow *mainWindow = qobject_cast<QQuickWindow *>(rootObj);

    // if (mainWindow) {
    //     qDebug() << "hello";
    //     QObject::connect(&app, &QCoreApplication::aboutToQuit, [&mainWindow]() {
    //         qDebug() << "hello1";
    //         mainWindow->setProperty("shouldClose", true);
    //     });
    // }

    return app.exec();
}

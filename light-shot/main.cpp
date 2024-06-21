#include <QGuiApplication>
#include <QQmlApplicationEngine>
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

    return app.exec();
}

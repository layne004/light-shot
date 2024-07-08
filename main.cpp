#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "screenshotprovider.h"
#include "windowrect.h"
#include "windowundercursor.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImageProvider("screenshot", new ScreenshotProvider);
    qmlRegisterType<WindowRect>("Windowrect", 1, 0, "WindowRect");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("lightshot", "MainWindow");

    return app.exec();
}

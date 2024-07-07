#include "imagesaver.h"
#include <QClipboard>
#include <QDir>
#include <QEventLoop>
#include <QImage>
#include <QMargins>
#include <QPainter>
#include <QPixmap>
#include <QQuickItemGrabResult>
#include <QScreen>
#include <QSharedPointer>
#include <QTimer>
#include <QWindow>
#include "screenshotprovider.h"

ImageSaver::ImageSaver(QObject *parent)
    : QObject{parent}
{}

void ImageSaver::saveImage(QQuickItem *item, QRect area, QString filepath)
{
    // //QSharedPointer<QQuickItemGrabResult> QQuickItem::grabToImage()
    QSharedPointer<const QQuickItemGrabResult> grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug("Failed to grab");
	exit(EXIT_FAILURE);
    }

    QEventLoop loop;
    connect(grabResult.data(), &QQuickItemGrabResult::ready, &loop, &QEventLoop::quit);
    loop.exec();

    // connect 防止grab还未完成就开始下一步操作
    bool gs;

    m_tempPath = filepath;

    if (area.isEmpty()) {
        qDebug() << "empty\n";
        gs = grabResult->image().copy(area).save(filepath);
    } else {
        area -= QMargins{2, 2, 2, 2};
        gs = grabResult->image().copy(area).save(filepath);
    }
    qDebug() << "is save success: " << gs;
}

void ImageSaver::saveScreenshot(QRect clip, QString filename)
{
    QScreen *screen = QGuiApplication::primaryScreen();
    m_tempPath = filename;
    if (!screen)
        qDebug() << "Failed to get screen!";
    else {
        // get pixmap info
        QPixmap pixmap = screen->grabWindow(0);
        if (!pixmap)
            qDebug() << "Failed to get pixmap!";

        if (clip.isEmpty())
            pixmap.save(filename);
        else {
            clip -= QMargins{2, 2, 2, 2};
            QPixmap clipScreenshot = pixmap.copy(clip);
            clipScreenshot.save(filename);
        }
    }
}

void ImageSaver::saveImageToClip(QQuickItem *item, QRect area)
{
    QSharedPointer<const QQuickItemGrabResult> grabResult = item->grabToImage();

    if (!grabResult) {
        qDebug() << "Failed to grab";
        exit(EXIT_FAILURE);
    }

    if (!area.isEmpty())
        area -= QMargins{2, 2, 2, 2};

    QClipboard *clipboard = QGuiApplication::clipboard();

    QEventLoop loop;
    loop.connect(grabResult.data(), &QQuickItemGrabResult::ready, &loop, &QEventLoop::quit);
    loop.exec();

    QImage grabImg = grabResult->image();
    if (grabImg.isNull()) {
        qDebug() << "Failed to convert grabResult to QImage.";
        exit(EXIT_FAILURE);
    }

    m_tempPath = QDir::temp().absoluteFilePath(GlobalValues::time());

    if (area.isEmpty()) {
        clipboard->setImage(grabImg);
        grabImg.save(m_tempPath);
    } else {
        area -= QMargins{2, 2, 2, 2};
        QImage final = grabImg.copy(area);
        clipboard->setImage(final);
        final.save(m_tempPath);
    }
}

void ImageSaver::saveScreenshotToClip(QRect area)
{
    auto screen = QGuiApplication::primaryScreen();
    QPixmap pixmap;
    if (area.isEmpty())
        pixmap = screen->grabWindow(0);
    else {
        area -= QMargins{2, 2, 2, 2}; //剪掉border.width
        pixmap = screen->grabWindow(0, area.x(), area.y(), area.width(), area.height());
    }

    m_tempPath = QDir::temp().absoluteFilePath(GlobalValues::time());

    QClipboard *clipboard = QGuiApplication::clipboard();
    if (clipboard)
        clipboard->setPixmap(pixmap);
    else
        qDebug() << "Failed to get clipboard.\n";

    pixmap.save(m_tempPath);
}

void ImageSaver::saveCanvasToClip(QQuickItem *image, QQuickItem *canvas, QRect area)
{
    QSharedPointer<const QQuickItemGrabResult> grabImage = image->grabToImage();
    QSharedPointer<const QQuickItemGrabResult> grabCanvas = canvas->grabToImage();

    if (!grabCanvas || !grabImage) {
        qDebug() << "Failed to grab";
        exit(EXIT_FAILURE);
    }

    QImage mergeImage(image->width(), image->height(), QImage::Format_ARGB32);
    mergeImage.fill(Qt::transparent);

    QPainter p(&mergeImage);

    QEventLoop loop;
    connect(grabCanvas.data(), &QQuickItemGrabResult::ready, &loop, &QEventLoop::quit);
    loop.exec();

    p.drawImage(QPoint(0, 0), grabImage->image());
    p.drawImage(QPoint(0, 0), grabCanvas->image());

    QImage final = mergeImage.copy(area);

    m_tempPath = QDir::temp().absoluteFilePath(GlobalValues::time());

    QClipboard *clipboard = QGuiApplication::clipboard();
    if (clipboard)
        clipboard->setImage(final);
    else
        qDebug() << "Failed to get clipboard.\n";

    final.save(m_tempPath);
}

void ImageSaver::saveFullScreen(QObject *window, QRect area)
{
    if (!window) {
        qDebug() << "Failed to get window";
        return;
    }

    QWindow *qmlWindow = qobject_cast<QWindow *>(window);

    qmlWindow->hide();

    QTimer::singleShot(400, [qmlWindow, area, this]() {
        saveScreenshotToClip(area);
        qmlWindow->show();
    });
}

bool ImageSaver::copyAndSave(QString sourcePath, QString targetPath)
{
    QImage image;
    QString path = sourcePath;
    if (path.startsWith("image://")) {
        QString providerId = path.section('/', 2, 2);
        QString imageId = path.section('/', 3);

        QQmlImageProviderBase *base = qmlEngine(this)->imageProvider(providerId);
        ScreenshotProvider *provider = dynamic_cast<ScreenshotProvider *>(base);

        if (provider) {
            image = provider->getFromCache(imageId);
        } else {
            qDebug() << "Error: ImageProvider not found for ID:" << providerId;
            return false;
        }
    } else {
        if (path.startsWith("file://")) {
            QString filepath = path.section('/', 2);
            image.load(filepath);
        } else
            image.load(path);
    }

    if (!image.isNull()) {
        bool s = image.save(targetPath);
        if (s)
            return true;
        else {
            qDebug() << "Error: failed to save image.";
            return false;
        }
    } else {
        qDebug() << "Error: image is Null!";
        return false;
    }
}

QString ImageSaver::getTempPath() const
{
    return m_tempPath;
}

void ImageSaver::setTempPath(const QString &newTempPath)
{
    if (m_tempPath == newTempPath)
        return;
    m_tempPath = newTempPath;
    emit tempPathChanged();
}

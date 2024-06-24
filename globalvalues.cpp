#include "globalvalues.h"
#include <QDateTime>
#include <QStandardPaths>

#define STDDATETIME qPrintable(QDateTime::currentDateTime().toString("yyyyMMdd_HHmmss"))

namespace GlobalValues {
QString HOMEPATH = QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + "/";
QString DEF_FILENAME = (HOMEPATH + QString("%1.png").arg(STDDATETIME)); //default filename
QString TIME = QString("%1.png").arg(STDDATETIME);
} // namespace GlobalValues

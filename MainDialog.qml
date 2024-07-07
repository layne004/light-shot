import QtQuick
import QtQuick.Dialogs
import QtCore

Item {
    property alias fileSave: _fileSave

    FileDialog{
        id:_fileSave
        title: qsTr("Save image as")
        currentFolder: StandardPaths.writableLocation(StandardPaths.HomeLocation)
        fileMode: FileDialog.SaveFile
        nameFilters: [ "Image files (*.png)" ]
    }
}

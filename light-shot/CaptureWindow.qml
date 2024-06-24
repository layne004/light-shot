/*
    author:CaiJiali   date:2024-06-18
    CaptureWindow: capture rectangle region and provide toolbar
*/
import QtQuick
import QtQuick.Controls
import lightshot

Window {
    id:captureWindow
    flags: Qt.FramelessWindowHint
    visibility: ApplicationWindow.FullScreen

    Image{
        id:cw_image
        source: "image://screenshot/now"
        fillMode: Image.PreserveAspectFit
    }

    //InActive Region

    SelectionRect{
        id:selectRect
        focus: true
        anchors.fill: parent
        Keys.onEscapePressed: close();
    }

    Component.onCompleted: showFullScreen()
}

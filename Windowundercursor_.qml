//import QtQuick

import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: Screen.width
    height: Screen.height
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        MouseArea {
            anchors.fill: parent
            onClicked: {
MainWindow.visible=false


            }
        }
    }
}


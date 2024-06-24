import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button{
    id:btn
    scale: 0
    property alias animation: buttonAnimation

    Layout.alignment: Qt.AlignVCenter;
    Layout.rightMargin: 5
    background: Rectangle{
        anchors.fill: parent
        color: parent.pressed? "#005E30":"#00974A"
        radius: width/2
    }

    ParallelAnimation{
        id:buttonAnimation
        PropertyAnimation{
            target: btn
            properties: "scale"
            from: 0;
            to: 1.1;
            duration: 200
            easing.type: Easing.InCubic
        }
        PropertyAnimation{
            target: btn
            properties: "opacity"
            from: 0;
            to: 1;
            duration: 200
            easing.type: Easing.InCubic
        }
    }

}

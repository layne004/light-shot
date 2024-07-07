import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import lightshot

Window {
    id: pinWindow
    visible: true
    width: 300
    height: 200
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    property url imgSource: _pinImg.source
    property alias pinImg: _pinImg
    property real ratio;

    ImageSaver{
        id:pinSaver
    }

    Menu{
        id:contextMenu

        MenuItem{
            text: qsTr("copy to clipboard")
        }

        MenuItem{
            text: qsTr("save to file")
            onTriggered: pinSaver.copyAndSave(_pinImg.source);
        }

        MenuSeparator{}

        MenuItem{
            text: qsTr("close")
            onTriggered: pinWindow.close()
        }
    }

    Rectangle {
      id: rect
      anchors.fill: parent
      anchors.margins: 5

      Image{
          id:_pinImg
          anchors.fill: rect
          fillMode: Image.PreserveAspectFit
      }

      DragHandler{
          id:moveHandler
          dragThreshold: 0
          onActiveChanged: {
              if(active)
                  pinWindow.startSystemMove();

          }
      }

    }

    MouseArea{
        id:mouseHandle
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton |Qt.RightButton
        onClicked: (ep)=>{
                       if(ep.button === Qt.RightButton)
                       contextMenu.popup();
                   }
    }

    WheelHandler{
        onWheel: (wheel)=>{
                const scaleFactor = Math.pow(1.0002, wheel.angleDelta.y)
                const newWidth = pinWindow.width * scaleFactor
                const newHeight = pinWindow.height * scaleFactor
                const aspectRatio = pinWindow.width / pinWindow.height
                if (newWidth / newHeight !== aspectRatio) {
                    pinWindow.setGeometry(pinWindow.x, pinWindow.y, newWidth, newWidth / aspectRatio)
                }else{
                    pinWindow.setGeometry(pinWindow.x, pinWindow.y, newWidth, newHeight)
                }
        }
    }

    DropShadow {
        anchors.fill: rect
        horizontalOffset: 0
        verticalOffset: 0
        radius:  moveHandler.active?8:5
        samples: 10
        source: rect
        color: "#00974A"
        Behavior on radius { NumberAnimation { duration: 100 } }
    }

}

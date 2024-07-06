import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Window {
    id: pinWindow
    visible: true
    width: 300
    height: 200
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    Menu{
        id:contextMenu

        MenuItem{
            text: qsTr("copy to clipboard")
        }

        MenuItem{
            text: qsTr("save to file")
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
      DragHandler{
          id:moveHandler
          dragThreshold: 0
          onActiveChanged: {
              if(active)
                  main.startSystemMove();

          }
      }

      layer.enabled: true
      layer.effect: DropShadow {
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

    MouseArea{
        id:mouseHandle
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton |Qt.RightButton
        onClicked: (ep)=>{
                       if(ep.button === Qt.RightButton)
                       contextMenu.popup();
                   }
    }

}

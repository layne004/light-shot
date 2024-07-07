/*
    author:CaiJiali   date:2024-06-18
    CaptureWindow: capture rectangle region and provide toolbar
*/
import QtQuick
import QtQuick.Controls
import lightshot
import "rectscreenshot.js" as Func

Window {
    id:captureWindow
    flags: Qt.FramelessWindowHint
    visibility: ApplicationWindow.FullScreen
    property alias selectArea: selectRect.selection
    property string temp;
    property var rectSize: Qt.rect(selectArea.x, selectArea.y, selectArea.width, selectArea.height)
    property int modeResize: selectRect.mode.Resizing
    property int modeDrag: selectRect.mode.Dragging;
    property alias pinWindow: pinloader.item

    ImageSaver{
        id:saver;
    }

    Image{
        id:cw_image
        source: "image://screenshot/now"
        fillMode: Image.PreserveAspectFit
    }

    //InActive Region

    Rectangle{
        id:topOverlay;
        x:0; y:0;
        width: cw_image.width;
        height: selectArea.y;
        color: "#60000000"
    }

    Rectangle{
        id:bottomOverlay
        x:0; y:selectArea.y+selectArea.height;
        width: cw_image.width;
        height: cw_image.height - topOverlay.height - selectArea.height;
        color: "#60000000"
    }

    Rectangle{
        id:leftOverlay
        x:0; y:selectArea.y
        width: selectArea.x
        height: selectArea.height
        color: "#60000000"
    }

    Rectangle{
        id:rightOverlay
        x:selectArea.x+selectArea.width
        y:selectArea.y;
        width: cw_image.width - leftOverlay.width - selectArea.width
        height: selectArea.height
        color: "#60000000"
    }

    SelectionRect{
        id:selectRect
        focus: true
        anchors.fill: parent
        Keys.onEscapePressed: close();
    }

    Loader{
        id:pinloader

        onLoaded: {
            item.closing.connect(function(){
                source = "";
                captureWindow.close();
            })
        }
    }

    SelectionActions{
        id:actions
        close.onTriggered: {captureWindow.close();}
        accept.onTriggered: Func.acceptAction();
        pencil.onTriggered: selectRect.modeValue = selectRect.mode.Pencil
        line.onTriggered: selectRect.modeValue = selectRect.mode.Line
        square.onTriggered: selectRect.modeValue = selectRect.mode.Square
        circle.onTriggered: selectRect.modeValue = selectRect.mode.Circle
        pin.onTriggered: Func.pinAction()
    }

    Component.onCompleted: showFullScreen()
}


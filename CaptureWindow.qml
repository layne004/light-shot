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
    property alias selectArea: selectRect.selection
    property string temp;
    property var rectSize: Qt.rect(selectArea.x, selectArea.y, selectArea.width, selectArea.height)

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

    SelectionActions{
        id:actions
        close.onTriggered: {captureWindow.close();}
        accept.onTriggered: {
            if(selectRect.modeValue === selectRect.mode.Resizing
                    && selectRect.modeValue === selectRect.mode.Dragging)
                saver.saveImageToClip(cw_image, rectSize);
            else{
                saver.saveCanvasToClip(cw_image, selectRect.pencilCanvas, rectSize);
            }
            temp = saver.tempPath;
            captureWindow.close();
        }
        pencil.onTriggered: selectRect.modeValue = selectRect.mode.Pencil
        line.onTriggered: selectRect.modeValue = selectRect.mode.Line
    }

    Component.onCompleted: showFullScreen()
}


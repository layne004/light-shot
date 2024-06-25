/*
    author:CaiJiali,DengKe   startDate:2024-06-18
    selection: provide selectable region
*/
import QtQuick
import QtQuick.Controls
import "lightshot.js" as Func
import QtQuick.Layouts

Item{

    property alias selection: rect
    property var startPos: Qt.point(0,0)
    property var endPos: Qt.point(0,0)
    property bool resizing:true
    property bool dragging: false;
    property bool penciling: false;

    property var lines: []

    // signal pencil();

    Rectangle{
        id:rect

        color: "transparent"
        border.width: 2
        border.color: "#00974A"

        Pane{
            id:tool
            width: parent.width
            height: 40
            background: Rectangle{
                anchors.fill: parent;
                color: "transparent"
            }

            visible: rect.width>0?true:false;

            anchors.top: rect.bottom
            anchors.horizontalCenter: rect.horizontalCenter

            //tool buttons
            RowLayout{
                id:rowlayout
                spacing: 5
                SelectAreaButtons{
                    action: actions.pencil
                    visible: !resizing
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                    //todo WithinBounds gesture
                }
                SelectAreaButtons{
                    action: actions.line
                    visible: !resizing
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                }
                SelectAreaButtons{
                    action: actions.square
                    visible: !resizing
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                }
                SelectAreaButtons{
                    action: actions.circle
                    visible: !resizing
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                }
                //todo 'redo/undo'
                SelectAreaButtons{
                    action: actions.close
                    visible: !resizing
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                }

                SelectAreaButtons{
                    action: actions.accept
                    visible: !resizing
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                }

            }

        }
    }

    DragHandler{
        id:selectHandler
        dragThreshold: 0;

        property bool isInButton: false
        property var rectX;
        property var rectY;

        onActiveChanged: {

            resizing = !Func.isInArea(centroid.position);
            dragging = Func.isInArea(centroid.position) & !penciling;
            penciling = Func.isInArea(centroid.position) & !dragging;
            if(resizing){
                cursorShape = Qt.CustomCursor
                rect.width = 0;
                rect.height = 0
                if(active){
                    startPos = centroid.position;
                    rect.x = startPos.x;
                    rect.y = startPos.y;
                }else{
                    endPos = centroid.position
                    Func.updateSize(startPos, endPos);
                    resizing = false;
                    dragging = true;
                }
            }else if(dragging){
                cursorShape = Qt.SizeAllCursor;
                rectX = rect.x;
                rectY = rect.y;
            }else if(penciling){
                cursorShape = Qt.CrossCursor;
                if(active){
                    lines.push([])
                    lines[lines.length - 1].push({x:centroid.position.x, y:centroid.position.y})
                    drawCanvas.requestPaint();
                }else
                    drawCanvas.requestPaint();
            }
        }

        onActiveTranslationChanged: {
            if(resizing)
                Func.updateSize(startPos, centroid.position);
            else if(dragging)
            {
                rect.x = rectX + activeTranslation.x;
                rect.y = rectY + activeTranslation.y;
            }else if(penciling){
                if(Qt.LeftButton){
                    lines[lines.length - 1].push({x:centroid.position.x, y:centroid.position.y});
                    drawCanvas.requestPaint();
                }
            }
        }

    }

    Canvas {
            id: drawCanvas
            anchors.fill: parent
            onPaint: {
                var ctx = drawCanvas.getContext("2d");
                ctx.clearRect(0, 0, drawCanvas.width, drawCanvas.height);
                ctx.lineWidth = 3;
                ctx.strokeStyle = "red";
                ctx.beginPath();
                for (var i = 0; i < lines.length; i++) {
                    var line = lines[i];
                    if (line.length > 1) {
                        ctx.moveTo(line[0].x, line[0].y);
                        for (var j = 1; j < line.length; j++) {
                            ctx.lineTo(line[j].x, line[j].y);
                        }
                    }
                }
                ctx.stroke();
            }

    }
}

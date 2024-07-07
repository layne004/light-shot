/*
    author:CaiJiali   startDate:2024-06-18
    selection: provide selectable region
*/
import QtQuick
import QtQuick.Controls
import lightshot
import "lightshot.js" as Func
import QtQuick.Layouts

Item{

    property alias selection: rect
    property alias pencilCanvas: drawCanvas
    property var startPos: Qt.point(0,0)
    property var endPos: Qt.point(0,0)

    property variant mode: ({
        Resizing: 0,
        Dragging: 1,
        Pencil: 2,
        Line: 3,
        Square: 4,
        Circle: 5
    })

    property int modeValue: mode.Resizing
    property var lines: []
    property var squares: []
    property var circles: []
    property point squarePos
    property point circlePos

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
                    visible: modeValue === mode.Resizing? false:true
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
                    visible: modeValue === mode.Resizing? false:true
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
                    visible: modeValue === mode.Resizing? false:true
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
                    visible: modeValue === mode.Resizing? false:true
                    onVisibleChanged: {
                        if(visible)
                            animation.start();
                    }
                    onHoveredChanged: {
                        Func.setPropagation(hovered);
                    }
                }

                SelectAreaButtons{
                    action: actions.pin
                    visible: modeValue === mode.Resizing? false:true
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
                    visible: modeValue === mode.Resizing? false:true
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
                    visible: modeValue === mode.Resizing? false:true
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

            if(modeValue !== mode.Resizing && modeValue !== mode.Dragging);
            else{
                if(Func.isInArea(centroid.position))
                    modeValue = mode.Dragging;
                else
                    modeValue = mode.Resizing;
            }

            switch(modeValue){
            case mode.Resizing:{
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
                break;
            }
            case mode.Dragging:{
                cursorShape = Qt.SizeAllCursor;
                rectX = rect.x;
                rectY = rect.y;
                break;
            }
            case mode.Pencil:{
                cursorShape = Qt.CrossCursor;
                if(active){
                    lines.push([])
                    lines[lines.length - 1].push({x:centroid.position.x, y:centroid.position.y})
                    drawCanvas.requestPaint();
                }else
                    drawCanvas.requestPaint();
                break;
            }
            case mode.Line:{
                cursorShape = Qt.CrossCursor;
                if(active){
                    var startX = centroid.position.x;
                    var startY = centroid.position.y;
                    lines.push({startX: startX, startY: startY, endX: startX, endY: startY});
                    drawCanvas.requestPaint();
                }else
                    drawCanvas.requestPaint();
                break;
            }
            case mode.Square:{
                cursorShape = Qt.CrossCursor;
                if(active){
                    squarePos = centroid.position;
                    squares.push({x: squarePos.x, y: squarePos.y, width: 0, height: 0});
                    drawCanvas.requestPaint();
                }else
                    drawCanvas.requestPaint();
                break;
            }
            case mode.Circle:{
                cursorShape = Qt.CrossCursor;
                if(active){
                    circlePos = centroid.position;
                    circles.push({x: circlePos.x, y: circlePos.y, width: 0, height: 0});
                    drawCanvas.requestPaint();
                }else
                    drawCanvas.requestPaint();
                break;
            }
            }

        }

        onActiveTranslationChanged: {

            switch (modeValue){
            case mode.Resizing:
                Func.updateSize(startPos, centroid.position);
                break;
            case mode.Dragging:
                rect.x = rectX + activeTranslation.x;
                rect.y = rectY + activeTranslation.y;
                break;
            case mode.Pencil:
                lines[lines.length - 1].push({x:centroid.position.x, y:centroid.position.y});
                drawCanvas.requestPaint();
                break;
            case mode.Line:
                lines[lines.length - 1].endX = centroid.position.x;
                lines[lines.length - 1].endY = centroid.position.y;
                drawCanvas.requestPaint();
                break;
            case mode.Square:
                squares[squares.length - 1].width = centroid.position.x - squarePos.x;
                squares[squares.length - 1].height = centroid.position.y - squarePos.y;
                drawCanvas.requestPaint();
                break;
            case mode.Circle:
                circles[circles.length - 1].width = centroid.position.x - circlePos.x;
                circles[circles.length - 1].height = centroid.position.y - circlePos.y;
                drawCanvas.requestPaint();
                break;
            }

        }

    }

    Canvas {
            id: drawCanvas
            anchors.fill: parent

            onPaint: {
                var ctx = drawCanvas.getContext("2d");
                ctx.clearRect(drawCanvas.x, drawCanvas.y, drawCanvas.width, drawCanvas.height);
                // 不使用switch(modeValue)的原因是，每次新绘制开始前可能还需要将之前的痕迹绘制好。

                //先画pencil痕迹
                ctx.lineWidth = 2;
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

                //再画line
                ctx.beginPath();

                for (var a = 0; a < lines.length; a++) {
                    ctx.moveTo(lines[a].startX, lines[a].startY);
                    ctx.lineTo(lines[a].endX, lines[a].endY);
                }
                ctx.stroke();

                //draw squares
                ctx.beginPath();
                for(var s = 0; s < squares.length; s++)
                    ctx.rect(squares[s].x, squares[s].y, squares[s].width, squares[s].height);
                ctx.stroke();

                //draw circles
                ctx.beginPath();
                for(var c = 0; c < circles.length; c++)
                    ctx.ellipse(circles[c].x, circles[c].y, circles[c].width, circles[c].height);
                ctx.stroke();

            }

    }

}

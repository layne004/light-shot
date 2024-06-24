import QtQuick

Rectangle{
    id:dragRect
    property int crsType: Qt.ArrowCursor
    property var callBackFunc; //更新尺寸
    property var dragStartpos: Qt.point(0,0)
    property var dragEndpos: Qt.point(0,0)
    property alias hoverhandler: _hoverhandler

    width: 3*2
    height: width
    color: "#00974A"
    radius: width/2
    border.color:"#00974A"
    border.width: 2

    signal dragStarted(var localPos);

    DragHandler{
        target: parent

        onActiveChanged: {
            if(active)
                dragStarted(centroid.position)
            else
                callBackFunc();
        }
    }

    HoverHandler{
        id:_hoverhandler
        target: parent
        onHoveredChanged: {
            if(hovered)
                cursorShape = crsType
            else
                cursorShape = Qt.ArrowCursor
        }
    }

}

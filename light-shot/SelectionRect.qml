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
    property bool isResizing:true

    Rectangle{
        id:rect

        color: "transparent"
        border.width: 2
        border.color: "#00974A"

    }

    DragHandler{
        id:selectHandler
        dragThreshold: 6;

        property bool isInButton: false
        property var rectX;
        property var rectY;

        onActiveChanged: {

            isResizing = !Func.isInArea(centroid.position);
            if(isResizing === true){
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
                    isResizing = false;
                }
            }else{
                cursorShape = Qt.SizeAllCursor;
                rectX = rect.x;
                rectY = rect.y;
            }
        }

        onActiveTranslationChanged: {
            if(isResizing === true)
                Func.updateSize(startPos, centroid.position);
            else
            {
                rect.x = rectX + activeTranslation.x;
                rect.y = rectY + activeTranslation.y;
            }
        }

    }

}

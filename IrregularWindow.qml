/*
    author  :Hecuiying
    date    :2024.06.20
    purpose :获取鼠标圈定不规则图形的实时坐标，传给IrregularShot类
*/

import QtQuick
import QtQuick.Controls
import lightshot
import "lightshot.js" as Func

Window{
    id:irregularWindow
    flags: Qt.FramelessWindowHint
    visibility: ApplicationWindow.FullScreen
    // color: Qt.rgba(0,0,0,0.3)

    property var points:[]
    property string irregularImgpath

    Image {
        id: iw_image
        source: "image://screenshot/current"
        fillMode: Image.PreserveAspectFit
    }

    //不规则区域选择
    Canvas{
        id:canvas
        anchors.fill: parent
        focus: true

        onPaint: {
            var ctx=getContext("2d");
            ctx.clearRect(0,0,canvas.width,canvas.height);

            if(points.length>1){
                ctx.beginPath();
                ctx.moveTo(points[0].x,points[0].y);
                for(var i=1;i<points.length;i++){
                    ctx.lineTo(points[i].x,points[i].y);
                }

                ctx.lineTo(points[0].x,points[0].y);
                ctx.strokeStyle="red"
                ctx.lineWidth=2;
                ctx.fillStyle=Qt.rgba(0,255,0,0.3);
                ctx.fill();
                ctx.stroke();
                ctx.closePath();

            }
        }

    }

    DragHandler{
        id:dHandler
        dragThreshold: 1

        onActiveChanged:(mouse)=> {
                             if(active){
                                 points.push({x:dHandler.centroid.position.x,y:dHandler.centroid.position.y});
                                 // console.log("in onActiveChanged:",dHandler.centroid.position.x,dHandler.centroid.position.y);
                                 // console.log("points in onActiveChanged:",points);
                             } else {
                                 points.push({x:dHandler.centroid.position.x,y:dHandler.centroid.position.y});
                                 canvas.requestPaint();
                                 if(points.length>2){
                                     var polygon=points.map(function(p){
                                         return Qt.point(p.x,p.y);
                                     });

                                    irregularImgpath=globalIrregularShot.capture(iw_image,polygon);
                                    console.log("to test IrregularWindow 是否成功连接上capture()");
                                    irregularWindow.close();
                                    Func.onScreenshotCaptured();
                                 }
                             }
        }

        onActiveTranslationChanged:{
                                        if(active){
                                            // console.log("in onPositionChanged:",dHandler.centroid.position.x,dHandler.centroid.position.y);
                                            points.push({x:dHandler.centroid.position.x,y:dHandler.centroid.position.y});
                                            canvas.requestPaint();//重绘Canvas
                                                              //检测points中每个点坐标是否传输正确
                                                              // console.log("points in onPositionChanged:");
                                                              // for(var i=0;i<points.length;i++){
                                                              //     console.log("Point "+i+":x="+points[i].x+",y="+points[i].y);
                                                              // }
                                        }
                                    }

    }

    // IrregularShot{
    //     id:irregularshot
    // }

    Component.onCompleted: showFullScreen()


}
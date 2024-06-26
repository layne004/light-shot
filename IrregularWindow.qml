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
    property IrregularShot globalIrregularShot: globalIrregularShot

    IrregularShot{
        id:globalIrregularShot
    }

    Image {
        id: iw_image
        source: "image://screenshot/current"
        fillMode: Image.PreserveAspectFit
    }

    //不规则区域圈定选择
    Canvas{
        id:canvas
        anchors.fill: parent
        focus: true

        property int dashOffset: 0

        onPaint: {
            var ctx=getContext("2d");
            ctx.clearRect(0,0,canvas.width,canvas.height);

            if(points.length>1){
                //设置虚线画笔
                ctx.setLineDash([5,5]);//5像素的实线接着5像素的空白
                ctx.lineDashOffset=dashOffset;//虚线偏移量

                ctx.beginPath();
                ctx.moveTo(points[0].x,points[0].y);
                for(var i=1;i<points.length;i++){
                    ctx.lineTo(points[i].x,points[i].y);
                }

                // ctx.lineTo(points[0].x,points[0].y);
                ctx.strokeStyle="red"
                ctx.lineWidth=2;
                // ctx.fillStyle=Qt.rgba(0,255,0,0.3);//绿色
                ctx.fillStyle=Qt.rgba(0,0,0,0) //透明色
                ctx.fill();
                ctx.stroke();// 沿着当前路径描边
                ctx.closePath();
            }
        }

        // 当dashOffset改变时，重新绘制Canvas
        onDashOffsetChanged: requestPaint()
    }

    Timer{
        id:animationTimer
        interval: 130//设置定时器间隔
        repeat: true

        onTriggered: {
            //更新dashOffset的值来创建动画效果
            //5是虚线和空白的长度，所以5*2是一个完整的虚线周期
            canvas.dashOffset=(canvas.dashOffset+2)%(5*2);
        }
    }

    DragHandler{
        id:dHandler
        dragThreshold: 1

        onActiveChanged: {
                             if(active){
                                 points.push({x:dHandler.centroid.position.x,y:dHandler.centroid.position.y});
                             } else {
                                points.push({x:dHandler.centroid.position.x,y:dHandler.centroid.position.y});
                                canvas.requestPaint();//重绘Canvas
                                globalIrregularShot.capture(iw_image,points);
                                irregularImgpath=globalIrregularShot.tempPath;
                                irregularWindow.close();
                             }
        }

        onActiveTranslationChanged:{
            if(active){
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

    Component.onCompleted: {
        showFullScreen()
        //启动定时器开始动画
        animationTimer.start();
    }

}

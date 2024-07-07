/*
 * author: CaiJiali
 * date: 2024.06.21
 * MainWindow: 主窗口作为截图控制器
 */

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import lightshot
import "lightshot.js" as Controller

ApplicationWindow {
    id:mainWindow
    width: 740
    height: 580
    visible: true
    title: qsTr("lightshot")

    header: ToolBar{
        RowLayout{
            ToolButton{
                action: actions.save
            }
            ToolButton{
                action: actions.saveAs
            }
        }
    }

    //main content
    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id:mw_imageItem
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#fcfcfc"
            border.color: "#d2d2d2"
            Image{
                property bool isImageChanged: false
                id:mwImage
                source: "image://screenshot/current"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                anchors.margins: 5
                onSourceChanged: {
                    mwImage.isImageChanged = true;
                }
            }
        }
        Rectangle{
            id:mw_toolItem
            Layout.preferredWidth: 250
            Layout.fillHeight: true
            color: "#fcfcfc"
            border.color: "#d2d2d2"

            ColumnLayout{
                anchors.fill: parent
                GroupBox{
                    Layout.fillWidth: true
                    Layout.topMargin: 5
                    title: qsTr("Screenshot")
                    ColumnLayout{
                        anchors.fill: parent
                        MainButtons{
                            action: actions.rectRegion
                        }
                        MainButtons{
                            action: actions.irreguler
                        }
                        MainButtons{
                            action: actions.fullscreen
                        }
                        MainButtons{
                            action: actions.activeWindow
                        }
                        MainButtons{
                            action: actions.windowUnderCursor
                        }
                    }
                }
                GroupBox{
                    title: qsTr("Capture Settings")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    ColumnLayout{
                        anchors.fill: parent
                        CheckBox{action: actions.defaultSave;Layout.alignment: Qt.AlignTop}
                    }
                }
            }
        }
    }

    property bool flag;

    //toOptimize 暂时使用Timer来防止截图包含主窗口
    Timer{
        id:rectTimer
        interval: 300
        repeat: false;
        onTriggered: {
            if(flag)
                loader.source = "CaptureWindow.qml"
            else
                loader.source = "IrregularWindow.qml";
        }
    }

    ImageSaver{
        id:screenSaver
    }

    MainDialog{
        id:dialog
    }

    MainActions{
        id:actions
        save.onTriggered: Controller.save();
        saveAs.onTriggered: Controller.saveAs();
        rectRegion.onTriggered: Controller.selectRect()
        irreguler.onTriggered: Controller.selectIrregular()
        fullscreen.onTriggered: Controller.fullScreen();
    }

    Loader{
        id:loader
        onLoaded: {
            item.closing.connect(function(){
                if(loader.item.temp)
                    mwImage.source = "file://"+loader.item.temp;
                if(loader.item.irregularImgpath)
                    mwImage.source = "file://"+loader.item.irregularImgpath;

                loader.source = ""
                mainWindow.show();
            })
        }
    }

    // SystemTrayIcon{
    //     id:sysTray
    //     visible: true
    //     icon.source: "/img/app/lightshot.ico"

    //     //此处的MenuItem是Qt.labs的，所以没有action property
    //     menu: Menu{
    //         MenuItem{
    //             text: qsTr("Quit")
    //             onTriggered: Qt.quit();
    //         }
    //     }

    //     onActivated: {
    //         //todo 调用rectRegion
    //     }

    //     Component.onCompleted: showMessage("","I have been started and am running in the background! Right-click the tray icon to view more options.", 50)
    // }




}

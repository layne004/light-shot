/*
 * author: CaiJiali
 * date: 2024.06.21
 * MainWindow: 主窗口作为截图控制器
 */

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
// import lightshot

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
            color: "white"
            border.color: "#d2d2d2"
            Image{
                id:mwImage
                source: "image://screenshot/current"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                anchors.margins: 5
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

    MainActions{
        id:actions
    }
}

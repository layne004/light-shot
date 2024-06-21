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
    width: 640
    height: 480
    visible: true
    title: qsTr("lightshot")

    header: ToolBar{
        RowLayout{
            ToolButton{
                id:_save
                text: "1"
            }
            ToolButton{
                id:_saveAs
                text: "2"
            }
        }
    }

    //main content
    RowLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id:mw_image
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "white"
            border.color: "#d2d2d2"
        }
        Rectangle{
            id:mw_toolItem
            Layout.preferredWidth: 200
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
                        Button{
                            Layout.alignment: Qt.AlignHCenter
                            text: "1"
                        }
                        Button{
                            Layout.alignment: Qt.AlignHCenter
                            text: "1"
                        }
                        Button{
                            Layout.alignment: Qt.AlignHCenter
                            text: "1"
                        }
                        Button{
                            Layout.alignment: Qt.AlignHCenter
                            text: "1"
                        }
                        Button{
                            Layout.alignment: Qt.AlignHCenter
                            text: "1"
                        }
                    }
                }
                GroupBox{
                    title: qsTr("Capture Settings")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    ColumnLayout{
                        anchors.fill: parent
                        CheckBox{text: "1";Layout.alignment: Qt.AlignTop}
                    }
                }
            }
        }
    }

}

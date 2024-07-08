import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window{
    visible: true
    title: qsTr("About")
    maximumWidth: 420
    minimumWidth: 420
    maximumHeight: 300
    minimumHeight: 300

    RowLayout{
        anchors.fill: parent
        ColumnLayout{
            Layout.fillWidth: true
            Layout.horizontalStretchFactor: 1
            Image {
                id: icon
                Layout.preferredWidth: 100
                source: "qrc:///img/app/lightshot.ico"
                fillMode: Image.PreserveAspectFit
            }
        }
        ColumnLayout{
            Layout.fillWidth: true
            Layout.horizontalStretchFactor: 3
            Text {
                id:linkText
                Layout.topMargin: 20
                Layout.preferredHeight: 30
                textFormat: Text.RichText
                text: "<b><u>site:</u></b> <a href = 'https://github.com/layne004/light-shot.git'>lightshot.git</a>"

                onLinkActivated: (link)=>{
                        Qt.openUrlExternally(link)
                }
                HoverHandler{
                    onHoveredChanged: {
                        if(hovered)
                            cursorShape = Qt.PointingHandCursor
                    }
                }
            }
            Text{
                Layout.preferredHeight: 30
                textFormat: Text.RichText
                text: "<b><u>Version:<u></b> 0.1.0"
            }
            Text {
                Layout.preferredHeight: 30
                text: qsTr("<b><u>License:</u></b> GPLv3")
            }
            Text{
                Layout.preferredHeight: 30
                text: qsTr("© CQNU software-engineering group5")
            }
            GroupBox{
                Layout.preferredWidth: 300
                Text{
                    Layout.fillWidth: true
                    text: qsTr("Lightshot is a free software, and"+
                                "\nyou can download its source \ncode from the above site.")
                }
            }
            Item{
                Layout.fillHeight: true
            }

        }
    }
}

/*
 * author: CaiJiali
 * date: 2024.06.21
 * MainActions: mainwindow's actions
 */
import QtQuick
import QtQuick.Controls

Item {

    property alias save: _save
    property alias saveAs: _saveAs
    property alias rectRegion: _rectRegion
    property alias irreguler: _irregular
    property alias fullscreen: _fullscreen
    property alias activeWindow: _activeWindow
    property alias windowUnderCursor: _windowUnderCursor
    property alias defaultSave: _defaultSave

    //ToolBar actions
    Action{
        id:_save
        icon.name: "document-save"
        shortcut: StandardKey.Save
        text: qsTr("save")
    }

    Action{
        id:_saveAs
        icon.name: "document-save-as"
        shortcut: StandardKey.SaveAs
        text: qsTr("saveAs")
    }

    //Button actions
    Action{
        id:_rectRegion
        text: qsTr("Rectangle Region")
    }

    Action{
        id:_irregular
        text: qsTr("Irregular Screenshot")
    }

    Action{
        id:_fullscreen
        text: qsTr("Full Screen")
    }

    Action{
        id:_activeWindow
        text: qsTr("Active Window")
    }

    Action{
        id:_windowUnderCursor
        text: qsTr("Window Under Cursor")
    }

    //CheckBox action
    Action{
        id:_defaultSave
        text: qsTr("Default Save")
        checkable: true
    }
}

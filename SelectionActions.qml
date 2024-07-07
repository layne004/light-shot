import QtQuick
import QtQuick.Controls

Item {

    property alias pencil: _pencil
    property alias line: _line
    property alias square: _square
    property alias circle: _circle
    property alias pin: _pin
    property alias close: _close
    property alias accept: _accept

    Action{
        id:_pencil
        icon.source: "qrc:///img/material/pencil.svg"
    }

    Action{
        id:_line
        icon.source: "qrc:///img/material/line.svg"
    }

    Action{
        id:_square
        icon.source: "qrc:///img/material/square.svg"
    }

    Action{
        id:_circle
        icon.source: "qrc:///img/material/circle.svg"
    }

    Action{
        id:_undo
        icon.source: "qrc:///img/material/undo.svg"
    }

    Action{
        id:_redo
        icon.source: "qrc:///img/material/redo.svg"
    }

    Action{
        id:_pin
        icon.source: "qrc:///img/material/pin.svg"
    }

    Action{
        id:_close
        icon.source: "qrc:///img/material/close.svg"
    }

    Action{
        id:_accept
        icon.source: "qrc:///img/material/accept.svg"
    }
}

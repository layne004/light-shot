import QtQuick
import QtQuick.Controls

Item {

    property alias pencil: _pencil
    property alias line: _line
    property alias square: _square
    property alias circle: _circle
    property alias close: _close
    property alias accept: _accept

    Action{
        id:_pencil
        icon.source: "/img/material/pencil.svg"
    }

    Action{
        id:_line
        icon.source: "/img/material/line.svg"
    }

    Action{
        id:_square
        icon.source: "/img/material/square.svg"
    }

    Action{
        id:_circle
        icon.source: "/img/material/circle.svg"
    }

    Action{
        id:_undo
        icon.source: "/img/material/undo.svg"
    }

    Action{
        id:_redo
        icon.source: "/img/material/redo.svg"
    }

    Action{
        id:_close
        icon.source: "/img/material/close.svg"
    }

    Action{
        id:_accept
        icon.source: "/img/material/accept.svg"
    }
}

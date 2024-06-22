import QtQuick
import QtQuick.Controls

Item {

    property string path: "file:///root/learn-git/github/lightshot/img/"
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
        icon.source: path + "square.svg"
    }

    Action{
        id:_circle
        icon.source: path + "circle.svg"
    }

    Action{
        id:_undo
        icon.source: path + "undo.svg"
    }

    Action{
        id:_redo
        icon.source: path + "redo.svg"
    }

    Action{
        id:_close
        icon.source: path + "close.svg"
    }

    Action{
        id:_accept
        icon.source: "/img/material/accept.svg"
    }
}

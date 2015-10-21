import QtQuick 2.0

pragma Singleton

QtObject {

property QtObject window: QtObject{
 property color background: "yellow";
        Rectangle
        {
        width:30; height:20

 }

property QtObject border: QtObject{
 property QtObject width: QtObject{
 property int normal: 1;
 property int big: 3;
 }

property QtObject color: QtObject{
 property color normal: "gray";
 property color focus: "blue";
 property color disabled: "red";
 }
 }
}
    }

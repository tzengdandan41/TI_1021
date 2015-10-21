import QtQuick 2.0

Item{
    id:item01
    property var text;
    Text{
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50
        color: "green"
        text: item01.text
    }
}





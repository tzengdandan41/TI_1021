import QtQuick 2.0

Rectangle {
    id: rectangle
    property alias text: input.text
    property alias input:input
    property alias w: rectangle.width
    property alias h: rectangle.height


    width:input.contentWidth < 100 ? 100 : input.contentWidth + 10;
    height:input.contentheight + 10
    color:"#eaeef1"; border.color: "#d3bbbb"
    TextInput{
        id:input
        anchors.fill:parent
        anchors.margins:5
        focus:true
    }
}


import QtQuick 2.0

Text{
    property string title
    property int size
    property color defaultColor
    text: "<b>" + title + "</b>"
    font.pixelSize:  size
    color: defaultColor
}

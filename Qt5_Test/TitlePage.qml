import QtQuick 2.0

Item{
    id:root
    property string title
    property color defaultColor1
    property color defaultColor2
    TitleText{
        title: root.title
        size: 22
        anchors.top : parent.top
        color: defaultColor1
    }
    TitleText{
        title:root.title
        size:18
        anchors.bottom: parent.bottom
        color: defaultColor2
    }
}


import QtQuick 2.0

Item{
    property Component mycomponent: comp1
    QtObject{
        id: internalSettings
        property color color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    }
    Component{
        id:comp1
        Rectangle{
            color: internalSettings.color
            width:360; height:10
        }
    }
}

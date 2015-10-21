import QtQuick 2.0

Rectangle {
    id:root;
    property bool pressed: mouseArea.pressed
    signal buttonClicked(real xPos, real yPos)
    signal buttonDoubleClicked()
    function randomizeColor(){root.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)}
    width:30;height:30
    color:"lightblue"

    MouseArea{
        id: mouseArea
        anchors.fill: root
        onClicked: root.buttonClicked(mouse.x, mouse.y)
        onDoubleClicked:  root.buttonDoubleClicked()
    }
}


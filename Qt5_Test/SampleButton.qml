import QtQuick 2.0

Rectangle {
    id:rectBtn
    signal activated(real x, real y)
    signal deactivated()
    width:100; height:100
    MouseArea{
        anchors.fill:parent
        onPressed: activated(mouse.x, mouse.y)
        onReleased:deactivated()
        onClicked: {
            rectBtn.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
            rectBtn.x = Math.random() * (200 - 100) + 0
            rectBtn.y = Math.random() * (200 - 100) + 0
        }
    }
}

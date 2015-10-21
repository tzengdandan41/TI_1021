import QtQuick 2.0

Rectangle {
    id:rect;
    width: 50; height:50;
    color: "blue"

    NumberAnimation on opacity{
        to: 0;  duration: 3000
        onRunningChanged:{
            if(!running){
                console.log("Destroying...")
                rect.destroy()
            }
        }
    }

}


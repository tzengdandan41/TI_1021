import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window {
   width: 1750; height: 850; visible: true
   //color: "yellow"
   Rectangle{
       x:0;y:0
       width:50; height:30
       id:main_page
       color:"violet"
       Text{
           color: "blue"
           text:"回到第一階段"
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
       }

       MouseArea{
           anchors.fill: main_page

           onReleased: {loader_mainPage.source = "qrc:/main.qml"; close()}
       }
   }
   Loader {
       id: loader_mainPage
   }
}


import QtQuick 2.0
import QtQuick.Window 2.2

Window
{
    width: 360; height: 240; visible: true
    Column{
        Custom_Component{
            text: "daniel"
        }
        Text{
            font.pixelSize: Style_Singleton.window

        }

    }
}


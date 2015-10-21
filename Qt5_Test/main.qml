import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "MyScript.js" as MyScript
import "componentCreation.js" as ComponentScript
import "my_button_impl.js" as Logic
import "factorial.js" as FactorialCalculator
import "script.js" as Script
import QtQuick.Layouts 1.1
Window
{
    /*minimumWidth: layout.Layout.minimumWidth
    maximumWidth: layout.Layout.maximumWidth
    minimumHeight: layout.Layout.minimumHeight
    maximumHeight: layout.Layout.maxmumHeight
    visible: true*/
    /*minimumWidth: layout.implicitHeight
    maximumWidth: layout.implicitWidth
    visible: true*/
    width: 1750; height: 850; visible: true
        Rectangle
        {
            // visible: true
            id: rect
            width: 360; height: 200
            color:"red"

            Text{text:"world"}
            SampleButton{
                onActivated: console.log("Activated " + x + "," + y)
                onDeactivated: console.log("Deactivated")
            }
            onStateChanged:
            {
                console.log("*************")
                rect.color = "blue"
            }
        }
        Rectangle{
            id:rect2
            width:360; height:50
            color:"blue"
            x: 0; y: 200
            MouseArea{
                id: mouseArea
                anchors.fill: parent
            }
            Connections{
                target:mouseArea
                onClicked: rect2.color = "yellow"
            }
        }
        Rectangle{
            id: rect3
            width:360; height:50
            x: 0; y: 250
            color: Qt.rgba(0.54,0.22,0.33,1)
            signal messageReceived(string person, string notice)
            Component.onCompleted: {
                rect3.messageReceived.connect(sendToPost)
                rect3.messageReceived.connect(sendToTelegraph)
                rect3.messageReceived.connect(sendToEmail)
                rect3.messageReceived("Tom", "Happy birthday")
            }

            function sendToPost(person, notice){
                console.log("Sending to post: " + person + "," + notice);
            }
            function sendToTelegraph(person, notice){
                console.log("Sending to telegraph: " + person + "," + notice);
            }
            function sendToEmail(person, notice){
                console.log("Sendiong to email: " + person + "," + notice);
            }
        }
        Rectangle{
            id: rect4
            width:360; height: 50
            x: 0; y: 300
            color: Qt.rgba(0.80,0.56,0.31,1)
            signal send()
            onSend: console.log("Send clicked")
            MouseArea{
                id: mousearea
                anchors.fill: parent
               // onClicked: console.log("MouseArea clicked")
                onDoubleClicked: console.log("Double clicked Area")
            }

            Component.onCompleted: {
              //  mousearea.clicked.connect(send)
                mousearea.doubleClicked.connect(send)
                //console.log("@@@@@@@@@@@@@@@@@@@@@@@@@")
            }
        }
        Rectangle{
            id: rect5
            width:360
            height:getHeight()
            function getHeight(){return 50*1}
            color: Qt.rgba(0.3,0.8,0.6,1)
            x: 0; y: 350
        }
        Rectangle{
            id: rect6
            width:360; height:50
            x: 0; y: 400
            color: Qt.rgba(0.7,0.6,0.2,1)
            MouseArea{
                anchors.fill: parent
                onClicked: label.moveTo(mouse.x, mouse.y)
            }
            Text{
                id: label
                text: "Move me";
                function moveTo(newX, newY){

                    if( (rect6.height - newY) > label.height && (rect6.width - newX) > label.width){
                        console.log("x = " + newX)
                        console.log("y = " + newY)
                        label.x = newX
                        label.y = newY
                    }
                }
            }
        }
        ListView{
            id:listview1
            width:360; height: 30
            x: 0; y:450
            model: 3; focus: true
            delegate: Rectangle{
                width:240; height:10
                color: ListView.isCurrentItem ? "red" : "yellow"
            }
        }
        ListView{
            id:listview2
            width:360; height:50
            x: 0; y: 480
            model: ListModel{
                id:listModel
                Component.onCompleted:{
                    for(var i=0; i<3; i++)
                       listModel.append( {"Name": "Item" + i})
                }
            }
            delegate: Text{text: index + "    " + Name}
        }

        Item{
            id: item1
            width: 360; height:50
            //color: Qt.rgba(0.2,0.2,0.4,1)
            x: 0; y: 530

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("AAAA")
                    console.log(item1.factorial(1))
                }
            }
            function factorial(a){
                a = parseInt(a);
                if(a<=0)
                    return 1;
                else
                    return a * factorial(a-1);
            }
        }

        Item{
            id: item2
            width: 360; height: 50
            x: 0; y: 580

            MouseArea{
                id: mouseArea2
                anchors.fill:  parent
                onClicked:  {
                    MyScript.jsFunction()
                    console.log(MyScript.jsFunction())
                    console.log("QQQ")
                }
            }
        }
        Rectangle{
            id:appWindow
            width:360 ; height:50
            x:0; y:630
            color: Qt.rgba(0.6,0.2,0.1,1)
            Component.onCompleted: ComponentScript.createSpriteObjects();
        }
        Item{
            id: container
            width: 360; height:50

            Component.onCompleted: {
                var component = Qt.createComponent("SelfDestroyingRect.qml");
                for(var i=0; i<5; i++){
                    var object = component.createObject(container);
                    object.x = (object.width + 10)* i;
                    object.y = 680
                }
            }
        }
        Rectangle{
            id:rect11; width:360; height:50; color: "lightblue"; x:360;y:0;
            MouseArea{
                id:mousearea11
                anchors.fill: parent
                onClicked: Logic.onClicked(rect11)
            }
        }
        Text{
            property int input: 3
            width:50; height:50;
            x:360; y:50;
            text:"The factorial of " + input + "is: " + FactorialCalculator.factorial(input);

        }
        Rectangle{
            width:360; height:50;
            x:360; y:100;
            color: Qt.rgba(0.6,0.25,0.88,1);
            MouseArea{
                anchors.fill: parent;
                onClicked:{
                    Script.showCalculations(3);
                    console.log("Call factorial() from QML: ", Script.factorial(10));
                }
            }
        }

        Item{
            x:360; y:150
            width:360; height:50
            Column{
                Square01Button{x:20; y:150}
                Square01Button{x:1; color:"blue";y:20}
                Square01Button{width:15; height:15; x:200; y:20}
                Square01Button{
                    id: square_Btn
                    onButtonClicked: {
                        console.log("Clicked",xPos, yPos)
                        randomizeColor()
                    }
                    onButtonDoubleClicked: {
                        console.log("DoubleClick")
                    }


                    Text{text: square_Btn.pressed ? "Down":"Up"}
                }
            }
        }

        Item{
            width:360; height:50
            Component{
                id: redSquare
                Rectangle{
                    color: Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                    width:10; height:10
                }
            }
            Loader{sourceComponent: redSquare; x:360; y:260}
            Loader{sourceComponent: redSquare; x:360; y:280}
        }
        ListView{
            width:30; height:50; model:4; x:360;y:300;spacing:5
            delegate: myItem.mycomponent
            MyItem{
                id:myItem
            }
        }

    Item{
        width:360;height:50
        x:360; y: 360
        property string title
        Text{
            id: title;
            x:0; y:10;
            text: "123"
            font.pixelSize: 22
            anchors.top: parent.top
        }
        Text{
            x:0; y:20
            text:title.text
            font.pixelSize: 18
            anchors.bottom: parent.bottom
        }
    }

    TitlePage{
        title: "dan"
        defaultColor1: "yellow"
        defaultColor2: "blue"
        x: 360
        y: 460
    }

    Text{
        id:txt1;
        x: 360; y:500
        text:qsTr("Back","not front");
    }

    Text{
        property var a: 1111
        property var b: 2222
        x: 360; y:520
        text:qsTr("File %1 %2").arg(a).arg(b)
    }

    Text{
        property var c: 4321.56
        x:360; y:540
        text:qsTr("%L1").arg(c)
    }

    Text{
        x:360; y:560
        text:qsTr("Date %1").arg(Date().toLocaleString(Qt.locale()))

        Component.onCompleted: {
            switch(Qt.locale().name.substring(0,2)){
                case "en":
                    console.log("en");
                    break;
                case "fi":
                    console.log("fi");
                    break;
                default:
                    console.log(Qt.locale().name);
            }
        }
    }
    Rectangle{
        id : photo                          //id放在第一行,方便找到一個對象
        property bool thumbnail : false     //屬性聲明
        property alias image : photoImage.source
        signal clicked                      //信號聲明
        function doSomething(x){            //javascript
            return x+photoImage.width
        }
        color:"gray"                        //對象屬性
        x:360;y:600;height:20                //相對屬性放在一起
        width:{                             //綁定
            if(photoImage.width > 200){
                photoImage.width;
            }
            else{
                200;
            }
        }
        Rectangle{                          //子對象
            id:border
            anchors.centerIn: parent; color:"white"
            Image{id:photoImage; anchors.centerIn: parent}
        }
        states: State{                      //狀態
            name: "selected"
            PropertyChanges{target:border; color: "red"}
        }
        transitions:Transition{
            from: ""; to: "selected"

            ColorAnimation {
                from: "yellow"; to:"blue"
                duration: 200
            }
        }
    }
    Item{
        Rectangle{
            opacity: 0.5
            color:"red"
            x:360;y:650
            width:50; height:50
            Rectangle{
                color:"blue"
                x:20;y:20
                width:50;height:50
            }
        }
        Rectangle{
            width:360; height:50
            x:360;y:700
            Text{
                anchors.centerIn: parent
                text:"Hellow World"
                width:25
                wrapMode: Text.WordWrap
               // clip:true
            }
        }
    }
    Item{
        x:720; y:0
        Column{
           spacing:20
           Text{
               width: 200
               text:"使本文在單行中對於超出部份不要進行省略"
               color: "black"
               font{pixelSize: 14; family:'Courier'}
           }
           Text{
               width:200
               elide:Text.ElideLeft
               text:"使本文在單行中對於超出部份從左邊進行省略"
               color: "black"
               font{pixelSize: 14; family:'Courier'}
           }
           Text{
               width:200
               elide:Text.ElideMiddle
               text:"使本文在單行中對於超出部份從中間進行省略"
               color: "black"
               font{pixelSize: 14; family:'Courier'}
           }
           Text{
               width:200
               elide:Text.ElideRight
               text:"使本文在單行中對於超出部份從右邊進行省略"
               color: "black"
               font{pixelSize: 14; family:'Courier'}
           }
           Text{
               width:200
               height:35
               elide:Text.ElideRight
               wrapMode: Text.WordWrap
               text: "對於可換行的多行本文,如果設置了高度,可以對超出部份從右邊進行省略"
               color: "blue"
               font{pixelSize: 14; family:'Courier'}
           }
           Text{
               width:150
               maximumLineCount: 3
               wrapMode: Text.WordWrap
               elide:Text.ElideRight
               color: "red"
               font{pixelSize: 14; family:'Courier'}
               text:"對於可換行的多行本文,如果沒設置了最大行數,可以對超出部份從右邊進行省略"
           }
        }
    }
    Item{
        x:720;y:260
        Column{
            Text{
                width:20
                font{bold:true}
                text:"粗體"
            }
            Text{
                width:20
                font.capitalization: Font.SmallCaps
                text:"AAAbbbccc"
            }
            Text{
                width:20
                font.letterSpacing: 10
                text:"Spacing"
            }
            Text{
                width:20
                font.pixelSize: 20
                text:"daniel"
            }
            Text{
                width:20
                font.pointSize: 20
                text:"daniel"
            }
        }
    }
    Item{
        x:720;y:360

        Column{            
            Text{
                font.weight: Font.Light
                text:"DANIEL"                
            }
            Text{
                font.weight: Font.Normal
                text:"DANIEL"
            }
            Text{
                font.weight: Font.Black
                text:"DANIEL"
            }
            Text{
                font.weight: Font.Bold
                fontSizeMode: Text.VerticalFit
                text:"DANIEL"
            }
        }
    }
    Item{
        x:720;y:420

        Column{
            FontLoader {
                  id: cFontLoader01
                  source: "./vrinda.ttf"
              }
            FontLoader {
                  id: cFontLoader02
                  source: "./segoeuii.ttf"
              }
            FontLoader {
                  id: cFontLoader03
                  source: "qrc:/tarzeau_ocr_a.ttf"
              }
            Text{
                text:"DANIEL"
                font.family: cFontLoader01.name
            }
            Text{
                text:"DANIEL"
                font.family: cFontLoader02.name
            }
            Text{
                text:"DANIEL"
                font.family: cFontLoader03.name
            }
            Text{
                text:"DANIEL"
            }
        }
    }
    Rectangle{
        width:360; height:30; color: "red"
        x:720; y:485
        Text{
            width:360; height:30
            horizontalAlignment:Text.AlignJustify
            verticalAlignment:Text.AlignVCenter
            text:"中心"
        }
    }
    Row{
        x:720; y:520
        Text{
            font.pointSize: 16; text:"Normal"
            color: Qt.rgba(0.8,0.2,0.3,1)
        }
        Text{
            font.pointSize: 16; text:"Raised"
            style:Text.Raised
            styleColor: "lightyellow"
        }
        Text{
            font.pointSize: 16; text:"OutLine"
            style:Text.Outline

        }
        Text{
            font.pointSize: 16; text:"Sunken"
            style:Text.Sunken
            styleColor:"lightblue"
        }
    }
    Item{
        x:720; y:550
        Text{
            textFormat: Text.PlainText
            text: "AUTO MOTOCYCLE"
            color: "olivedrab"
            font.pixelSize: 16
        }
    }
    Column{
        x:720; y:570
        Text{
            font.pixelSize: 24
            text: "<b>Hello</b><i>World</i>"
        }
        Text{
            font.pixelSize: 24
            textFormat: Text.RichText
            text: "<b>Hello</b><i>World</i>"
        }
        Text{
            font.pixelSize: 24
            textFormat: Text.PlainText
            text: "<b>Hello</b><i>World</i>"
        }
        Text{
            font.pixelSize: 24
            textFormat: Text.StyledText
            text: "<b>Hello</b><i>World</i>"
        }
    }
    Item{
        width:360; height:100
        x:720; y:680
        Text{
            textFormat: Text.RichText
            text: "See the <a href=\"http://www.yahoo.com.tw\">Qt Project website</a>."
            onLinkActivated: console.log(link + " link activated")
        }
    }
    Item{
        width:360; height:50
        x:720; y:700
        Rectangle{
            width:50; height:30;color: "lightblue"
            TextInput{
                text:"11"
                font.pixelSize: 16
                validator: IntValidator{bottom:11; top:31}
                focus:true
            }
        }
    }
    Rectangle{
        width: 360; height:50
        x:1080; y:0
        color: Qt.rgba(0.3,0.9,0.3,1)
        Grid{
            //x: 100; y:25
            rows:2; columns:4; //spacing:5
            Text{
                width: 72; height:25
                text:"Normal"
            }

            Text{
                width: 72; height:25
                text:"Password"
            }
            Text{
                width: 72; height:25
                text:"NoEcho"
            }
            Text{
                width: 72; height:25
                text:"PasswordEchoOnEdit"
            }
            TextInput{
                width: 72; height:25
                id:textInput1
                text:"Normal"
                echoMode: TextInput.Normal
                focus: false
                onAccepted:{
                    console.log(textInput1.text)
                    focus = false
                }
                onEditingFinished: text = "AAAAA"
            }
            TextInput{
                width: 72; height:25
                id:textInput2
                text:"Password"
                echoMode: TextInput.Password
                focus: true
                onAccepted:{
                    console.log(textInput2.text)
                    textInput2.focus = false
                }
            }
            TextInput{
                width:72; height:25
                id:textInput3
                text:"NoEcho"
                echoMode: TextInput.NoEcho
                onAccepted:{
                    console.log(textInput3.text)
                    textInput3.focus = false
                }
            }
            TextInput{
                width:72; height:25
                id:textInput4
                text:"PEOE"
                echoMode: TextInput.PasswordEchoOnEdit
                onAccepted:{
                    console.log(textInput4.text)
                    textInput4.focus = false
                }
            }
        }
    }
    Rectangle
    {
        x:1080; y:50
        width:300; height:20
        color: "lightblue"
        Text{
            color: "yellow"
            text : DemoClass.callme()
        }
    }
    Item{

    }

    Rectangle{
        id:rectangle10
        x:1080; y:70
        width:300; height:60
        color: Qt.rgba(0.77,0.22,0.33,1)
        property var input5 : "SelectCharacters"
        property var input6 : "SelectWords"
        property var input7 : "KeyNavigation.tab"
        TextInput{
            id:textInput5
            width:300; height:20
            text:rectangle10.input5
            selectByMouse:  true
            mouseSelectionMode: TextInput.SelectCharacters
        }
        TextInput{
            id:textInput6
            width:300; height:20
            text:rectangle10.input6
            y:20
            selectByMouse:  true
            mouseSelectionMode: TextInput.SelectWords
        }
        TextInput{
            id:textInput7
            width:300; height:20
            text:rectangle10.input7
            y:40
            KeyNavigation.tab: textInput6

            Keys.onPressed: {
                if(event.key == Qt.Key_Tab){
                    console.log("KeyPress")
                    rectangle10.input5 = textInput7.text
                }
            }
        }
    }
    Rectangle{
        x:1080; y:130
        width:300; height:110
        color: Qt.rgba(0.3,0.3,0.5,1)
        Row{
            TextInput{
                id: textInput01
                width:300; height:20
                x:0; y:0
                color: "lightgreen"
                text:"Hello Qt!"
                selectByMouse: true
                mouseSelectionMode: TextInput.SelectWords
                selectionColor: Qt.rgba(0.3,0.9,0.1,1)
                selectedTextColor: Qt.rgba(0.9,0.2,0.3,1)
                onAccepted:{
                    console.log("*****************************************")
                    console.log(selectedText.toString())
                    console.log(selectionStart)
                    console.log(selectionEnd)
                    console.log(getText(6,9))
                    insert(5, " Daniel ")

                    cut()
                    //deselect()
                }
                Grid{
                    id: grid_
                    width:300; height:90
                    x:0; y:20
                    rows: 2; columns :4
                    Button{
                        x:0; y:0
                        text:"copy"
                        width:75; height:30
                        MouseArea{
                                id:ma1
                                anchors.fill: parent
                                onClicked:{
                                    textInput01.copy()  //複制當前選取的內容,並存放記憶體中
                            }
                        }

                    }
                    Button{
                        x:75; y:0
                        width:75; height:30
                        text:"paste"
                        MouseArea{
                                id:ma2
                                anchors.fill: parent
                                onClicked:{
                                    textInput01.paste() //貼上當前記憶體的內容
                            }
                        }

                    }
                    Button{
                        x:150; y:0
                        width:75; height:30
                        text:"cut"
                        MouseArea{
                            id:ma3
                            anchors.fill: parent
                            onClicked:{
                                textInput01.cut()       //切除當前被選取的內容,並存放記憶體中
                            }
                        }

                    }
                    Button{
                        x:225; y:0
                        width:75; height:30
                        text:"deselect"
                        onClicked:{
                            textInput01.deselect()      //清除當前被選取的光標,但內容還在
                        }
                    }
                    Button{
                        x:0; y:30
                        width:75; height:30
                        text:"getText"
                        onClicked:{
                            textInput01.text = textInput01.getText(3,8)    //只取TextInput內的區段內容  Ex:3~8
                        }

                    }
                    Button{
                        x:75; y:30
                        width:75; height:30
                        text:"insert"
                        onClicked:{
                            textInput01.insert(5, " ***Daniel*** ")  //把要插入的內容從第幾個index擺起  EX:(index, 字串)
                        }

                    }
                    Button{
                        x:150; y:30
                        width:75; height:30
                        text:"redo"
                        onClicked:{
                            textInput01.redo()  //上一步
                        }
                    }
                    Button{
                        x:225; y:30
                        width:75; height:30
                        text:"undo"
                        onClicked:{
                            textInput01.undo()  //取消上一步
                        }
                    }
                    Button{
                        x:0; y:60
                        width:75; height:30
                        text:"remove"
                        onClicked:{
                            textInput01.remove(3,5)  //移除start和end之間的內容(start idx , end idx)
                        }
                    }
                    Button{
                        x:75; y:60
                        width:75; height:30
                        text:"selectAll"
                        onClicked:{
                            textInput01.selectAll()  //圈選所有內容
                        }
                    }
                    Button{
                        x:150; y:60
                        width:75; height:30
                        text:"selectWord"
                        onClicked:{
                            textInput01.selectWord()  //圈選游標最近的單字
                        }
                    }
                }
            }
        }
    }
    Item{
        x:1080; y:240
        width:200
        height:30
        NewTextInput{
            x:10; y:10
            text:"www.gter.org"
            input.onTextChanged: {console.log("Width: " + w.toString()); console.log("Height: " + h.toString())}
        }
    }
    TextEdit{
        x:1080; y:270
        width:240
        textFormat: Text.RichText
        text:"<b>Hello</b><i>World!</i>"
        font.family: "Hello My Friend"
        font.pointSize: 20
        color:"blue"
        focus:false
    }

    Flickable{
        id:flick
        x:1080; y:310
        width:300;height:20
        contentWidth: edit.paintedWidth
        contentHeight: edit.paintedHeight
        clip: true
        function ensureVisible(r)
        {
            if(contentX >= r.x)
                contentX = r.x;
            else if(contentX + width <= r.x + r.width)
                contentX = r.x + r.width - width
            if(contentY >= r.y)
                contentY = r.y;
            else if(contentY + height <= r.y + r.height)
                contentY = r.y + r.height - height;
        }
        TextEdit{
            id: edit
            text: "123546789"
            width: flick.width
            height: flick.height
            wrapMode: TextEdit.Wrap
            onCursorRectangleChanged: {
                flick.ensureVisible(cursorRectangle)
            }
        }
    }
    Grid{
        x:1080; y:330
        columns: 3
        spacing: 2
        Rectangle{color: "red"; width: 10; height:10}
        Rectangle{color: "green"; width: 10; height:10}
        Rectangle{color: "blue"; width: 10; height:10}
        Rectangle{color: "cyan"; width: 10; height:10}
        Rectangle{color: "magenta"; width: 10; height:10}
    }
    Grid{
        x:1080; y:360
        columns: 2; rows:2
        columnSpacing: 1; rowSpacing: 5
        Rectangle{color: "red"; width: 10; height:10}
        Rectangle{color: "green"; width: 10; height:10}
        Rectangle{color: "blue"; width: 10; height:10}
        Rectangle{color: "cyan"; width: 10; height:10}
    }
    Rectangle{
        x:1080; y:400
        color:"lightgreen"
        width:100; height:60
        Grid{

            columns: 2; rows:2; //spacing:2
            horizontalItemAlignment: Grid.AlignHCenter //Grid.AlignLeft, Grid.AlignRight and Grid.AlignHCenter
            verticalItemAlignment: Grid.AlignRight     //Grid.AlignTop, Grid.AlignBottom and Grid.AlignVCenter
            Rectangle{color: "red"; width: 20; height:20}
            Rectangle{color: "green"; width: 30; height:30}
            Rectangle{color: "blue"; width: 25; height:25}
            Rectangle{color: "cyan"; width: 15; height:15}
        }
    }
    Rectangle{
        x:1080; y:465
        color: "lightblue"
        width:150; height:60

        Flow{
            anchors.fill: parent
            anchors.margins:5
            spacing:5
            Text{text: "Text"; font.pixelSize: 10}
            Text{text: "Daniel"; font.pixelSize: 20}
            Text{text: "Flow"; font.pixelSize: 30}
            Text{text: "Text"; font.pixelSize: 20}
        }
    }

    Rectangle{
        x:1080; y:525
        id:rect112
        width:300; height:50
        color:"blue"
        focus:true
        MouseArea{
            id: mouseArea11
            anchors.fill: parent
             onClicked:{greenRect.visible = !greenRect.visible}
        }

        Column{
        spacing:2
        Rectangle{color:"red"; width:50; height:50}
        Rectangle{id: greenRect; color: "green"; width:20; height:50}
        Rectangle{color:"blue"; width:50; height:20}
        move: Transition{ NumberAnimation{properties: "x,y"; duration: 1000}}
        }
    }
    Grid{
        x:1080; y:650
        Repeater{
            model: 16
            Rectangle{
                id:rect12
                width:30;height:30
                border.width: 1
                //Positioner.isFirstItem 是否為第一個
                //Positioner.isLastItem  是否為最後一個
                color: (Positioner.index == 2) ? "yellow":"lightblue"
                Text{width:30;height:30;
                     text: rect12.Positioner.index;
                     horizontalAlignment:Text.AlignHCenter
                     verticalAlignment:Text.AlignVCenter}
            }
        }
    }
    Rectangle{
        x:1380;y:0
        width:200; height:200; color:"black"
        Grid{
            x:5;y:5
            rows:5; columns:5; spacing: 10
            Repeater{
                model:23
                Rectangle{
                    width: 30; height:30; color:"lightgreen"
                    Text{
                        text: index; font.pointSize: 20
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
    Rectangle{
        id:window
        x:1380; y:205
        width:120; height:120
        color:"lightblue"
        Rectangle{id:myRect; width:50; height:50; color:"red"}
        states:State{
            name:"push me"
            AnchorChanges{
                target:myRect
                anchors.top:window.top
                anchors.bottom:window.bottom
            }
            PropertyChanges{
                target:myRect
                anchors.topMargin: 10
                anchors.bottomMargin: 10
            }
        }
        transitions: Transition {
              // smoothly reanchor myRect and move into new position
              AnchorAnimation { duration: 1000 }
          }
        MouseArea{
            anchors.fill: parent
            onClicked: window.state = "push me"
        }
    }

    Rectangle{
        x:1380; y:340
        LayoutMirroring.enabled:  true
        LayoutMirroring.childrenInherit: true
        width:300; height:50
        color: "green"
        border.width: 3
        Row{
            anchors{left: parent.left; margins:1}
            y:5; spacing:5
            Repeater{
                model:5
                Rectangle{
                    color:"red"
                    opacity: (5 - index) / 5
                    width: 40; height:40
                    Text{
                        text:index + 1
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }

    RowLayout{
        id:layout
        anchors.fill: parent
        spacing:3
        Rectangle{
            color:"green"
            Layout.fillWidth: true
            Layout.minimumWidth: 20
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            Layout.minimumHeight: 20
            Text{
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }
        Rectangle{
            color:"red"
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            //Layout.maximumWidth: 900
            Layout.preferredHeight: 20
            Text{
                anchors.centerIn: parent
                text:parent.width + 'x' + parent.height
            }
        }
    }


    Rectangle{
        x:1380; y:600
        width:100; height:50
        id:dandan_page
        color:"red"
        Text{
            anchors.centerIn: parent
            text:"第二階段開始"
        }
        MouseArea{
            anchors.fill: dandan_page
            //onPressed: {
                     //function_main_browser.pos = Qt.point(8,145)
                     //function_main_browser.sourceSize = Qt.size(95,90)}

            onReleased: { loader_dandanPage.source = "qrc:/dandan.qml"; close()}
        }
    }
    Loader {
        id: loader_dandanPage
    }
}

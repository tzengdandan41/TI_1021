var clickCount = 0;
function onClicked(btn) {
    clickCount += 1;
    if((clickCount %5) == 0){
        btn.color = Qt.rgba(1,0,0,1);
    }
    else{
        btn.color = Qt.rgba(0,1,0,1);
    }
}


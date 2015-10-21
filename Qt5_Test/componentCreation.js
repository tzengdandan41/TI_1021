var component;
var sprite;
function createSpriteObjects(){
	component = Qt.createComponent("Sprite.qml");	
	if(component.status == Component.Ready)
	{
		console.log("AAAAAAAAAAA");
		finishCreation();
	}
	else
	{
		console.log("BBBBBBBBBB");
		component.statusChanged.connect(finishCreation);
	}
}
function finishCreation(){
	if(component.status == Component.Ready){
        sprite = component.createObject(appWindow, {"x":20, "y":20});
		if(sprite == null){
			//錯誤處理
			console.log("Error creating object");
        }
        else
        {
                 console.log("CCC" + component.status)
        }
	}
	else if(component.status == Component.Error){
		//錯誤處理
		console.log("Error loading component: ", ccomponent.errorString());
	}
    else
    {
        console.log(component.status)
    }
}
/*
function createSpriteObjects(){
	component = Qt.createComponent("Sprite.qml")
	sprite = component.createObject(appWindow);
	if(sprite == null){
		//錯誤處理
		console.log("Error creating object");		
	}
	else{
		sprite.x = 100;
		sprite.y = 100;
		//...
	}
}
*/

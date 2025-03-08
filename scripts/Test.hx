
//@:expose 


class Test extends Script {
	/*
		function onInit() {
			log("Test.init!");
		}
	 */
	 

	var thing:String;

	function onAttack(args) {
		log('Attack received with damage: ${Std.string(args.damage)}');
	} 

	function onOver(args) {
		log("ON OVER");
	}

	override function onLoad() {
		log("Test.load");
		thing = "HELLO";
		addEventListener("attack", "onAttack");
		addEventListener("onOver", "onOver");
	}

	override function onReload() {
		thing = ctx.stashed.thing;
		log("after reload: " + thing);	
		//event.on("attack", this.onAttack);
		//log(event.getListeners("attack"));

		//event.on("onOver", this.onOver);
	}

	function onUpdate(deltaTimeMS:Float) {
		log("Test.updated");
	}

	override function onUnload() {
		log("Test.unload");
		ctx.stashed = {
			thing: "NICE"
		}
	}

	function updateSprite(sprite, currentTimeSec:Float, deltaTimeMS:Float):Void {
		if (sprite.x > 800) sprite.setPosition(0, 300);
		sprite.rotate((360/1000) * deltaTimeMS);
		sprite.move(0.1*deltaTimeMS, 0);
		//sprite.rotation += (360/1000) * deltaTimeMS;
		//log("Rotation: " + sprite.rotation);
		/*
			log("Sprite Object: " + sprite);
			log("Sprite Type: " + Type.getClass(sprite));
			log("Sprite has rotation: " + Reflect.hasField(sprite, "rotation"));
			log("Sprite.rotation value: " + Reflect.field(sprite, "rotation"));
			*/
	}
}

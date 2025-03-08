import core.scripting.ScriptContext;
import core.ecs.Entity;
import h3d.Vector;

class Chest extends Script {
	function playAnimation(obj:h3d.scene.Object, anim:h3d.anim.Animation):h3d.anim.Animation {
		if (obj == null) {
			log("playAnimation: obj is null");
			return null;
		}
		if (anim == null) {
			log("playAnimation: anim is null");
			return null;
		}
		return obj.playAnimation(anim);
	}

	function loadAnimation(modelLib:hxd.fmt.hmd.Library, animName:String, loop:Bool = false):h3d.anim.Animation {
		if (modelLib == null) {
			log("loadAnimation: modelLib is null");
			return null;
		}

		try {
			var anim = modelLib.loadAnimation(animName);
			if (anim == null) {
				log("loadAnimation: anim is null");
				return null;
			} else {
				anim.loop = loop;
				return anim;
			}
		} catch (e) {
			log("loadAnimation: " + e);
			return null;
		}

		return null;
	}

	function onCreate(args) {
		log("chest onCreate");

		var position = new Vector(args.position?.x ?? 0, args.position?.y ?? 0, args.position?.z ?? 0);
		var rotation = new Vector(args.rotation?.x ?? 0, args.rotation?.y ?? 0, args.rotation?.z ?? 0);
		var scale = new Vector(args.scale?.x ?? 1, args.scale?.y ?? 1, args.scale?.z ?? 1);
		var modelLib = app.loadModelLibrary('cultist');
		var obj = app.createModelFromLibrary(modelLib);
		if (obj == null) {
			log("Failed to load model");
			return;
		}
		//log("Loaded model");

		if (args.parent != null) {
			args.parent.addChild(obj);
		} else {
			app.s3d.addChild(obj);
		}
		//log("Added to parent");

		//log("Position: " + position + ", Rotation: " + rotation + ", Scale: " + scale);

		obj.setPosition(position.x, position.y, position.z);
		obj.setRotation(rotation.x, rotation.y, rotation.z);
		obj.setScale(scale.x); // heaps only supports uniform scaling?

		var activateAnim = loadAnimation(modelLib,"open", false);
		var deactivateAnim = loadAnimation(modelLib,"close", false);
		var idleAnim = loadAnimation(modelLib,"idle", true);
		playAnimation(obj, idleAnim);

		var collider = obj.getCollider();
		var interaction = new h3d.scene.Interactive(collider, app.s3d);

		var firstOnOut = true;
		interaction.onOut = function(event) {
			// we put this here so the onOver animation won't happen as soon as we place something (mouse is over the pick)
			if (firstOnOut) {
				interaction.onOver = function(event) {
					playAnimation(obj, activateAnim);
				}
				firstOnOut = false;
			} else {
				var anim = playAnimation(obj, deactivateAnim);
				if (anim != null) {
					anim.onAnimEnd = () -> {
						playAnimation(obj, idleAnim);
					};
				}
			}
		}
	}

	override function onLoad() {
		addEventListener("onCreate", "onCreate");
	}

	override function onUnload() {
		// removeEventListener("onCreate", "onCreate");
	}

	override function onReload() {
		// addEventListener("onCreate", "onCreate");
	}
}

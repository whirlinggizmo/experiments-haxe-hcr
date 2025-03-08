// import tests.heaps.OrthoCameraController;
import core.scripting.ScriptHost;
import tests.heaps.remotePak.RemotePak;
import tests.heaps.GroundPlane;
import tests.heaps.OrthoCameraController;
import tests.heaps.MainApp;
import core.scripting.Script;
import core.ecs.Entity;
import core.logging.Log;
import hxd.Math;
import h3d.col.Bounds;
import h3d.Vector;

class World extends core.scripting.Script {

	// var engine:h3d.Engine;
	// var resLoader:hxd.res.Loader;
	// var cameraController:OrthoCameraController;
	// var resLoader:hxd.res.Loader;

	function loadWorld() {
		try {
			Log.debug("World.loadWorlddd");
			// resLoader = app.resLoader;
			var s2d = app.s2d;
			var s3d = app.s3d;
			var engine = app.engine;
			// var loader:hxd.res.Loader = ctx.loader;

			// var shadow:h3d.pass.DefaultShadowMap;
			// var ground:GroundPlane;
			// var cameraController:OrthoCameraController;

			// var bmf = loader.loadCache('fonts/komika_hand.fnt', hxd.res.BitmapFont);
			// FPS.init(s2d, bmf.toFont(), 0);
			engine.backgroundColor = 0x112639;

			// lighting
			var sun = new h3d.scene.fwd.DirLight(new h3d.Vector(0.3, -0.4, -0.9), s3d);
			sun.color = Vector.fromColor(0xffffffff);
			sun.color.scale(1.0);
			var lightSystem:h3d.scene.fwd.LightSystem = cast s3d.lightSystem;
			lightSystem.ambientLight.setColor(0xFFFFFFFF);
			lightSystem.ambientLight.scale(0.3);

			var shadow = s3d.renderer.getPass(h3d.pass.DefaultShadowMap);
			shadow.size = 2048;
			shadow.power = 150;
			shadow.blur.radius = 0;
			shadow.bias *= 0.1;
			shadow.color.set(0.5, 0.5, 0.5);

			// camera
			var orthoSize = 20;
			s3d.camera.target.set(0, 0, 0);
			s3d.camera.pos.set(-120, -120, 120);
			s3d.camera.zNear = 1;
			s3d.camera.zFar = 500;
			// Set orthographic bounds
			var orthoBounds = new Bounds();
			orthoBounds.xMin = -orthoSize * s3d.camera.screenRatio;
			orthoBounds.xMax = orthoSize * s3d.camera.screenRatio;
			orthoBounds.yMin = -orthoSize;
			orthoBounds.yMax = orthoSize;
			orthoBounds.zMin = s3d.camera.zNear;
			orthoBounds.zMax = s3d.camera.zFar;
			s3d.camera.orthoBounds = orthoBounds;

			var cameraController = new OrthoCameraController(s3d);
			// cameraController.setOrthoBounds(20, 1, 500, false);
			cameraController.loadFromCamera(false);

			log("ortho size: " + s3d.camera.orthoBounds.yMax);

			// ground
			var ground = new GroundPlane(256, 256, s3d);
			var clickStart:Vector = new Vector();
			var clickEnd:Vector = new Vector();
			ground.onPush = function(event) {
				if (event.button == LMB) {
					clickStart.set(event.relX, event.relY, event.relZ);
				}
			}
			ground.onClick = function(event) {
				clickEnd.set(event.relX, event.relY, event.relZ);
				log("ground clicked at " + event.relX + ", " + event.relY + ", " + event.relZ);
				var distanceFromStart = clickStart.distance(clickEnd);
				log("distance from start of click:" + distanceFromStart);
				if (distanceFromStart > 0.5) {
					// dragged too far for click
					return;
				}
				return onGroundClick(ground, event);

				/*
					var modelLib = app.loadModelLibrary('wooden_chest');
					var obj = app.createObjectFromLibrary(modelLib);
					var activateAnim = modelLib.loadAnimation("open");
					activateAnim.loop = false;
					var deactivateAnim = modelLib.loadAnimation("close");
					deactivateAnim.loop = false;
					var idleAnim = modelLib.loadAnimation("idle");
					idleAnim.loop = true;
					obj.playAnimation(idleAnim);
					obj.setPosition(event.relX, event.relY, event.relZ);
					ground.addChild(obj);

					var entity = new Entity();
					entity.attachScript("Test", (scriptInstance) -> {
						// Emit an "attack" event
						trace("CREATED ENTITY", entity.eid);
						entity.event.emit("attack", {damage: 50});
					});

					var collider = obj.getCollider();
					var interaction = new h3d.scene.Interactive(collider, s3d);

					var firstOnOut = true;
					interaction.onOut = function(event) {
						// we put this here so the onOver animation won't happen as soon as we place something (mouse is over the pick)
						if (firstOnOut) {
							interaction.onOver = function(event) {
								obj.playAnimation(activateAnim);
								entity.event.emit("onOver");
							}
							firstOnOut = false;
						} else {
							obj.playAnimation(deactivateAnim).onAnimEnd = () -> {
								obj.playAnimation(idleAnim);
							};
						}
					}
				 */
			}

			// trees
			var modelLib = app.loadModelLibrary('tree');
			var bounds = ground.getBounds();
			var maxX = bounds.getMax().x;
			var minX = bounds.getMin().x;
			var maxY = bounds.getMax().y;
			var minY = bounds.getMin().y;

			// create a bunch of trees
			for (i in 0...500) {
				var obj = app.createModelFromLibrary(modelLib);
				ground.addChild(obj);

				var s = 1.0 + (Math.random() - 0.5); // 1 + (-0.5 -> 0.5)
				var x = minX + Math.random(maxX - minX);
				var y = minY + Math.random(maxY - minY);
				var r = Math.random(Math.PI);
				obj.setPosition(x, y, 0);
				obj.setScale(s);
				obj.setRotation(0, 0, r);
			}
		} catch (e) {
			Log.error(e);
		}
	}

	function onGroundClick(ground, event) {

		var entity = new Entity();

		/*
			var modelLib = app.loadModelLibrary('wooden_chest');
			var obj = app.createObjectFromLibrary(modelLib);
			var activateAnim = modelLib.loadAnimation("open");
			activateAnim.loop = false;
			var deactivateAnim = modelLib.loadAnimation("close");
			deactivateAnim.loop = false;
			var idleAnim = modelLib.loadAnimation("idle");
			idleAnim.loop = true;
			obj.playAnimation(idleAnim);
			obj.setPosition(event.relX, event.relY, event.relZ);
			ground.addChild(obj);

			var collider = obj.getCollider();
			var interaction = new h3d.scene.Interactive(collider, app.s3d);

			var firstOnOut = true;
			interaction.onOut = function(event) {
				// we put this here so the onOver animation won't happen as soon as we place something (mouse is over the pick)
				if (firstOnOut) {
					interaction.onOver = function(event) {
						obj.playAnimation(activateAnim);
						entity.event.emit("onOver");
					}
					firstOnOut = false;
				} else {
					obj.playAnimation(deactivateAnim).onAnimEnd = () -> {
						obj.playAnimation(idleAnim);
					};
				}
			}
		 */

		 // save the event (it's a pointer to the event) values so we keep them when we
		 // return from the attach script callback
		 var posX = event.relX;
		 var posY = event.relY;
		 var posZ = event.relZ;
		entity.attachScript("Chest", (scriptHost)->{
			// on created
		}, (scriptHost) -> {
			// on loaded
			// Emit an "attack" event
			log("CREATED ENTITY:" + entity.eid);
			entity.dispatchEvent("onCreate", {
				parent: ground,
				position: {
					x: posX,
					y: posY,
					z: posZ
				},
				rotation: {
					x: 0,
					y: 0,
					z: Math.random(Math.PI * 2) - Math.PI
				}
			});
		});
	}

	override function onUnload() {
		log("world onUnload");
	}

	override function onReload() {
		log("world onReload");
	}

	override function onLoad() {
		log("world onLoad");
		loadWorld();
		return;

/* res load example, currently done by main

		RemotePak.initRemotePak();
		var url = "res/res.pak";
		#if !js
		url = "https://dev.whirlinggizmo.com/testbed/haxe/heaps-iso-chests/" + url;
		#end
		RemotePak.addPakFromUrl(url, (pakFile) -> {
			trace('Pak loaded from ' + url);
			loadWorld();
		}, (e) -> {
			trace('Failed to load pak from 	' + url);
			trace(e);
		});
*/
	}
}

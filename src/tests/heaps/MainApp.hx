package tests.heaps;

import core.stage.IStage;
import core.scripting.Script;
import core.app.IApp;
import core.logging.Log;
import core.scripting.ScriptContext;
import core.scripting.ScriptHost;
import tests.heaps.GroundPlane;
import tests.heaps.remotePak.RemotePak;
import haxe.Exception;
import haxe.io.Path;
import hxd.res.Loader;
import hxd.res.Model;
import h3d.Vector;
import h3d.Vector4;
import h3d.col.Bounds;
import hxd.Math;
import haxe.Json;
import core.util.JsonUtils;
// import core.entity.Entity;
import core.ecs.Entity;

class App implements IApp {
	public var name:String;

	public function new() {
		Log.info("App created");
		name = "MainApp";
	}

	public function init(stage:IStage, ?options:AppOptions) {}

	public function update(deltaTimeMS:Int):Int {
		throw new haxe.exceptions.NotImplementedException();
	}

	public function dispose() {}

	public function run(stage:IStage, ?options:AppOptions) {}

	public function quit() {}
}

@:expose
class MainApp extends hxd.App {
	static var cache = new h3d.prim.ModelCache();

	// static public var s3d:h3d.scene.Scene;
	// static public var s2d:h2d.Scene;
	// static public var engine:h3d.Engine;
	public var resLoader:hxd.res.Loader;

	// static public cameraController:OrthoCameraController;
	//public static var app:IApp;

	public function new() {
		super();
		MainApp.app = this;
	}

	//public function createApp() {
	//	app = new App();
	//}

	private static var app:MainApp = null;

	public static function getInstance():MainApp {
		if (app == null) {
			app = new MainApp();
		}
		return app;
	}

	// helper functions
	public function createModel(modelName:String):h3d.scene.Object {
		var modelLib = loadModelLibrary(modelName);
		return createModelFromLibrary(modelLib);
	}


	public function createModelFromLibrary(modelLib:hxd.fmt.hmd.Library):h3d.scene.Object {
		var model = modelLib.makeObject((imagePath:String) -> {
			var filename = Path.withoutDirectory(imagePath);
			imagePath = Path.join(['models', 'textures', filename]);
			try {
				var img = resLoader.load(imagePath);
				if (img == null) {
					Log.warn('Unable to find texture: ', imagePath);
					return null;
				}
				return img.toTexture();
			} catch (e) {
				Log.warn(e);
				var img = hxd.Res.loader.load("images/missing.png");
				return img.toTexture();
				// return hxd.Res.images.grid.toTexture();
				// trace("FAIL");
			}
			return null;
		});

		var mats = model.getMaterials();
		for (mat in mats) {
			mat.blendMode = h3d.mat.BlendMode.Alpha;
		}
		return model;
	}

	public function loadModelLibrary(modelName:String):hxd.fmt.hmd.Library {
		function loadModelLibraryWithExtension(modelName:String, extension:String):hxd.fmt.hmd.Library {
			var resource:hxd.res.Any;

			// make sure it starts with a dot
			if (extension.charAt(0) != '.') {
				extension = '.' + extension;
			}

			try {
				var modelPath = Path.join(['models', modelName + extension]);
				Log.debug('Trying $modelPath...');
				// resource = hxd.Res.loader.load(modelPath);
				var model = resLoader.loadCache(modelPath, hxd.res.Model);
				Log.info('Loaded model resource \'$modelName\' ($modelPath)');
				// var model = resource.toModel();
				return cache.loadLibrary(model);
			} catch (e) {
				//Log.debug('Failed to load model resource: $e');
				return null;
			}
		}

		Log.info('Loading library \'$modelName\'...');

		// try the hmd first
		var lib = loadModelLibraryWithExtension(modelName, '.hmd');

		if (lib == null) {
			// try fbx
			lib = loadModelLibraryWithExtension(modelName, '.fbx');
		}
		if (lib == null) {
			// glb
			lib = loadModelLibraryWithExtension(modelName, '.glb');
		}
		if (lib == null) {
			// .gltf
			lib = loadModelLibraryWithExtension(modelName, '.gltf');
		}
		if (lib == null) {
			var e = new Exception('Unable to find model: $modelName');
			Log.warn(e);
			throw e;
		}
		Log.info('Loaded library: $modelName');
		return lib;
	}

	override function init() {
		loadResources(() -> {
			Log.info('Loaded resources');

			//createApp();

			resLoader = hxd.Res.loader;

			ready();
			return;

			var shadow:h3d.pass.DefaultShadowMap;
			var ground:GroundPlane;
			var cameraController:OrthoCameraController;

			var bmf = resLoader.loadCache('fonts/komika_hand.fnt', hxd.res.BitmapFont);
			FPS.init(s2d, bmf.toFont(), 0);

			engine.backgroundColor = 0x112639;

			// lighting
			var sun = new h3d.scene.fwd.DirLight(new h3d.Vector(0.3, -0.4, -0.9), s3d);
			sun.color = Vector.fromColor(0xffffffff);
			sun.color.scale(1.0);
			var ambientLight = cast(s3d.lightSystem, h3d.scene.fwd.LightSystem).ambientLight;
			ambientLight.setColor(0xFFFFFFFF);
			ambientLight.scale(0.3);
			shadow = s3d.renderer.getPass(h3d.pass.DefaultShadowMap);
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
			// Create a camera controller
			// var controller = new h3d.scene.CameraController(s3d);
			// controller.loadFromCamera();
			// controller.rotateSpeed = 0;
			// controller.set(120, deg2rad(0), deg2rad(60), s3d.camera.target);
			cameraController = new OrthoCameraController(s3d);
			cameraController.loadFromCamera();

			// attach the world script
			var world = new Entity();
			world.attachScript("World", (scriptHost:ScriptHost) -> {
				scriptHost.setVar("app", this); // app = this;
				// Prepare the script instance (PreInit)
				// Here, we set the app and stage.  Note that the instance will be set in the base class as a static, so we only need to set it once
				//scriptHost.setApp(app);  
				//scriptHost.setStage(stage);
			}, (scriptHost:ScriptHost) -> {
				// Script instance successfully loaded
			});

			var foo = new Entity();
			foo.attachScript("Basic");
		}, (e:String) -> {
			trace('Failed to load resources for MainApp: $e');
		});
	}

	/*
		function init_old() {
			var shadow:h3d.pass.DefaultShadowMap;
			var ground:GroundPlane;
			var cameraController:OrthoCameraController;
			// loadModelLibrary('tree');
			// loadModelLibrary('wooden_chest');

			var bmf = hxd.Res.loader.loadCache('fonts/komika_hand.fnt', hxd.res.BitmapFont);
			// FPS.init(s2d, hxd.Res.fonts.komika_hand.toFont(), 0);
			FPS.init(s2d, bmf.toFont(), 0);
			engine.backgroundColor = 0x112639;

			// lighting
			var sun = new h3d.scene.fwd.DirLight(new h3d.Vector(0.3, -0.4, -0.9), s3d);
			sun.color = Vector.fromColor(0xffffffff);
			sun.color.scale(1.0);
			var ambientLight = cast(s3d.lightSystem, h3d.scene.fwd.LightSystem).ambientLight;
			ambientLight.setColor(0xFFFFFFFF);
			ambientLight.scale(0.3);
			shadow = s3d.renderer.getPass(h3d.pass.DefaultShadowMap);
			shadow.size = 2048;
			shadow.power = 150;
			shadow.blur.radius = 0;
			shadow.bias *= 0.1;
			shadow.color.set(0.5, 0.5, 0.5);
			//
			var clickStart:Vector = new Vector();
			var clickEnd:Vector = new Vector();

			ground = new GroundPlane(256, 256, s3d);
			ground.onPush = function(event) {
				if (event.button == LMB) {
					clickStart.set(event.relX, event.relY, event.relZ);
				}
			}
			ground.onClick = function(event) {
				clickEnd.set(event.relX, event.relY, event.relZ);
				trace("ground clicked at " + event.relX + ", " + event.relY + ", " + event.relZ);
				var distanceFromStart = clickStart.distance(clickEnd);
				trace("distance from start of click:", distanceFromStart);
				if (distanceFromStart > 0.5) {
					// dragged too far for click
					return;
				}
				var modelLib = loadModelLibrary('wooden_chest');
				var obj = createObjectFromLibrary(modelLib);
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
				entity.attachScript("Test", (scriptHost) -> {
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
			}
			



			var modelLib = loadModelLibrary('tree');
			var bounds = ground.getBounds();
			var maxX = bounds.getMax().x;
			var minX = bounds.getMin().x;
			var maxY = bounds.getMax().y;
			var minY = bounds.getMin().y;

			// create a bunch of trees

			for (i in 0...500) {
				var obj = createObjectFromLibrary(modelLib);
				ground.addChild(obj);

				var s = 1.0 + (Math.random() - 0.5); // 1 + (-0.5 -> 0.5)
				var x = minX + Math.random(maxX - minX);
				var y = minY + Math.random(maxY - minY);
				var r = Math.random(Math.PI);
				obj.setPosition(x, y, 0);
				obj.setScale(s);
				obj.setRotation(0, 0, r);
			}

			
			
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
			// Create a camera controller
			// var controller = new h3d.scene.CameraController(s3d);
			// controller.loadFromCamera();
			// controller.rotateSpeed = 0;
			// controller.set(120, deg2rad(0), deg2rad(60), s3d.camera.target);
			cameraController = new OrthoCameraController(s3d);
			cameraController.loadFromCamera();


		}
	 */

	// public function toString():String {
    //    return "MainApp Instance";
    //}

	function toString():String {
		// use json to stringify our object
		return Json.stringify(this, JsonUtils.getCircularReplacer());
	}

	function ready() {
		Log.debug("MainApp.ready");

		resLoader = hxd.Res.loader;
		// MainApp.engine = engine;
		// MainApp.s3d = s3d;
		// MainApp.s2d = s2d;

		var bmf = resLoader.loadCache('fonts/komika_hand.fnt', hxd.res.BitmapFont);
		FPS.init(s2d, bmf.toFont(), 0);

		// return;

		// attach the world script
		var world = new Entity();
		world.attachScript("World", (scriptHost:ScriptHost) -> {
			Log.debug("in attachScript.created callback");
			scriptHost.setVar("app", this); //app = this;
		}, (scriptHost:ScriptHost) -> {
			Log.debug("in attachScript.loaded callback");

			//scriptHost.setContextValue("app", app);

			// scriptHost.setContextValue("s3d", s3d);
			// scriptHost.setContextValue("s2d", s2d);
			// scriptHost.setContextValue("engine", engine);
			// scriptHost.setContextValue("loader", hxd.Res.loader);
		});
	}

	function loadResources(?onReady:() -> Void, ?onError:(e:String) -> Void) {
		// ready();
		// return;

		RemotePak.initRemotePak();
		var url = "res/res.pak";
		#if !js
		url = "https://dev.whirlinggizmo.com/testbed/haxe/heaps-iso-chests/" + url;
		#end
		RemotePak.addPakFromUrl(url, (pakFile) -> {
			Log.info('Pak loaded from ' + url);
			if (onReady != null)
				onReady();
		}, (e) -> {
			Log.error('Failed to load pak from 	' + url);
			if (onError != null)
				onError(e);
		});
	}

	function loadWorld(ctx:ScriptContext) {
		var shadow:h3d.pass.DefaultShadowMap;
		var ground:GroundPlane;
		var cameraController:OrthoCameraController;

		var bmf = hxd.Res.loader.loadCache('fonts/komika_hand.fnt', hxd.res.BitmapFont);
		FPS.init(ctx.s2d, bmf.toFont(), 0);
		ctx.engine.backgroundColor = 0x112639;

		// lighting
		var sun = new h3d.scene.fwd.DirLight(new h3d.Vector(0.3, -0.4, -0.9), ctx.s3d);
		sun.color = Vector.fromColor(0xffffffff);
		sun.color.scale(1.0);
		var ambientLight = cast(ctx.s3d.lightSystem, h3d.scene.fwd.LightSystem).ambientLight;
		ambientLight.setColor(0xFFFFFFFF);
		ambientLight.scale(0.3);
		shadow = ctx.s3d.renderer.getPass(h3d.pass.DefaultShadowMap);
		shadow.size = 2048;
		shadow.power = 150;
		shadow.blur.radius = 0;
		shadow.bias *= 0.1;
		shadow.color.set(0.5, 0.5, 0.5);

		// camera
		var orthoSize = 20;
		ctx.s3d.camera.target.set(0, 0, 0);
		ctx.s3d.camera.pos.set(-120, -120, 120);
		ctx.s3d.camera.zNear = 1;
		ctx.s3d.camera.zFar = 500;
		// Set orthographic bounds
		var orthoBounds = new Bounds();
		orthoBounds.xMin = -orthoSize * ctx.s3d.camera.screenRatio;
		orthoBounds.xMax = orthoSize * ctx.s3d.camera.screenRatio;
		orthoBounds.yMin = -orthoSize;
		orthoBounds.yMax = orthoSize;
		orthoBounds.zMin = ctx.s3d.camera.zNear;
		orthoBounds.zMax = ctx.s3d.camera.zFar;
		ctx.s3d.camera.orthoBounds = orthoBounds;
		// Create a camera controller
		// var controller = new h3d.scene.CameraController(s3d);
		// controller.loadFromCamera();
		// controller.rotateSpeed = 0;
		// controller.set(120, deg2rad(0), deg2rad(60), s3d.camera.target);
		cameraController = new OrthoCameraController(ctx.s3d);
		cameraController.loadFromCamera();

		// ground
		var ground = new GroundPlane(256, 256, ctx.s3d);
		var clickStart:Vector = new Vector();
		var clickEnd:Vector = new Vector();
		ground.onPush = function(event) {
			if (event.button == LMB) {
				clickStart.set(event.relX, event.relY, event.relZ);
			}
		}
		ground.onClick = function(event) {
			clickEnd.set(event.relX, event.relY, event.relZ);
			Log.debug("ground clicked at " + event.relX + ", " + event.relY + ", " + event.relZ);
			var distanceFromStart = clickStart.distance(clickEnd);
			Log.debug('distance from start of click:  $distanceFromStart');
			if (distanceFromStart > 0.5) {
				// dragged too far for click
				return;
			}
			var modelLib = loadModelLibrary('wooden_chest');
			var obj = createModelFromLibrary(modelLib);
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
			entity.attachScript("Test", null, (scriptHost) -> {
				// Emit an "attack" event
				Log.debug('CREATED ENTITY : $entity.eid');
				entity.dispatchEvent("attack", {damage: 50}); //entity.event.emit("attack", {damage: 50});
			});

			var collider = obj.getCollider();
			var interaction = new h3d.scene.Interactive(collider, ctx.s3d);

			var firstOnOut = true;
			interaction.onOut = function(event) {
				// we put this here so the onOver animation won't happen as soon as we place something (mouse is over the pick)
				if (firstOnOut) {
					interaction.onOver = function(event) {
						obj.playAnimation(activateAnim);
						entity.dispatchEvent("onOver");
					}
					firstOnOut = false;
				} else {
					obj.playAnimation(deactivateAnim).onAnimEnd = () -> {
						obj.playAnimation(idleAnim);
					};
				}
			}
		}

		// trees
		var modelLib = loadModelLibrary('tree');
		var bounds = ground.getBounds();
		var maxX = bounds.getMax().x;
		var minX = bounds.getMin().x;
		var maxY = bounds.getMax().y;
		var minY = bounds.getMin().y;

		// create a bunch of trees
		for (i in 0...500) {
			var obj = createModelFromLibrary(modelLib);
			ground.addChild(obj);

			var s = 1.0 + (Math.random() - 0.5); // 1 + (-0.5 -> 0.5)
			var x = minX + Math.random(maxX - minX);
			var y = minY + Math.random(maxY - minY);
			var r = Math.random(Math.PI);
			obj.setPosition(x, y, 0);
			obj.setScale(s);
			obj.setRotation(0, 0, r);
		}
	}

	function deg2rad(i:Int) {
		return i * Math.PI / 180;
	}

	var nextUpdate = 0.0;
	var updateRate = 0.1;
	var targetRotation = new Vector();
	var currentRotation = new Vector();
	var smooth = 0.6;
	var totalTime = 0.0;

	override function update(dt:Float) {
		totalTime += dt;
		var dt2 = hxd.Math.min(1, 1 - Math.pow(smooth, dt * 60));
		FPS.update(dt);
		nextUpdate += dt;
		// cameraController.setOrthoSize(Math.sin(totalTime) * 10 + 20);
		if (nextUpdate >= updateRate) {
			nextUpdate = nextUpdate - updateRate;
			// do some throttled update here
			targetRotation.z += 0.1;
		}
		currentRotation.lerp(currentRotation, targetRotation, dt2);
		// ground.setRotation(currentRotation.x, currentRotation.y, currentRotation.z);
	}

	override function onResize() {
		var engine = h3d.Engine.getCurrent();
		var w = engine.width;
		var h = engine.height;
		Log.debug('Resizing to $w x $h');
		Log.debug('Ortho bnds: $w x $h');
	}

	/*

		// Provide a main entry point for the application.  This normally isn't called, except for testing without a different entry point (Main.hx)
		static public function main() {
			#if js
			RemotePak.initRemotePak();
			// RemotePak.addPakFromUrl("https://dev.whirlinggizmo.com/testbed/hxiso/res/res.pak", function (pakFile) {
			RemotePak.addPakFromUrl("res/res.pak", (pakFile) -> {
				new MainApp();
			}, (e) -> {
				trace(e);
			});
			#else
			hxd.Res.initEmbed();
			new MainApp();
			#end
		}
	 */
	// Provide a main entry point for the application.  This normally isn't called, except for testing without a different entry point (Main.hx)

	static public function start() {
		#if js
		RemotePak.initRemotePak();
		// RemotePak.addPakFromUrl("https://dev.whirlinggizmo.com/testbed/hxiso/res/res.pak", function (pakFile) {
		RemotePak.addPakFromUrl("res/res.pak", (pakFile) -> {
			new MainApp();
		}, (e) -> {
			trace(e);
		});
		#else
		hxd.Res.initEmbed();
		new MainApp();
		#end
	}
}

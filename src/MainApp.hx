import GroundPlane.LMB;
import haxe.Exception;
import haxe.io.Path;
import hxd.res.Loader;
import hxd.res.Model;
import h3d.Vector;
import h3d.Vector4;
import h3d.col.Bounds;
import hxd.Math;

class MainApp extends hxd.App {
	var shadow:h3d.pass.DefaultShadowMap;
	var ground:GroundPlane;
	var cameraController:OrthoCameraController;

	static public var ResourceLoader:hxd.res.Loader;

	var cache = new h3d.prim.ModelCache();

	public function new() {
		super();
	}

	function createObjectFromLibrary(modelLib:hxd.fmt.hmd.Library):h3d.scene.Object {
		var model = modelLib.makeObject((imagePath:String) -> {
			var filename = Path.withoutDirectory(imagePath);
			imagePath = Path.join(['models', 'textures', filename]);
			try {
				var img = ResourceLoader.load(imagePath);
				if (img == null) {
					trace('Unable to find texture: ', imagePath);
					return null;
				}
				return img.toTexture();
			} catch (e) {
				trace(e);
				var img = ResourceLoader.load("images/grid.png");
				return img.toTexture();
				// return hxd.Res.images.grid.toTexture();
				// trace("FAIL");
			}
			return null;
		});
		return model;
	}

	function loadModelLibrary(modelName:String):hxd.fmt.hmd.Library {
		function loadModelLibraryWithExtension(modelName:String, extension:String):hxd.fmt.hmd.Library {
			var resource:hxd.res.Any;

			// make sure it starts with a dot
			if (extension.charAt(0) != '.') {
				extension = '.' + extension;
			}

			try {
				var modelPath = Path.join(['models', modelName + extension]);
				trace('Trying $modelPath...');
				// resource = hxd.Res.loader.load(modelPath);
				var model = ResourceLoader.loadCache(modelPath, hxd.res.Model);
				trace('Loaded model resource \'$modelName\' ($modelPath)');
				// var model = resource.toModel();
				return cache.loadLibrary(model);
			} catch (e) {
				trace(e);
				return null;
			}
		}

		trace('Loading library \'$modelName\'...');

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
			trace(e);
			throw e;
		}
		trace('Loaded library: $modelName');
		return lib;
	}

	override function init() {
		ResourceLoader = hxd.Res.loader;
		loadModelLibrary('tree');
		loadModelLibrary('wooden_chest');

		var bmf = ResourceLoader.loadCache('fonts/komika_hand.fnt', hxd.res.BitmapFont);
		// FPS.init(s2d, hxd.Res.fonts.komika_hand.toFont(), 0);
		FPS.init(s2d, bmf.toFont(), 0);
		engine.backgroundColor = 0x112639;
		//
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

			var collider = obj.getCollider();
			var interaction = new h3d.scene.Interactive(collider, s3d);

			var firstOut = true;
			interaction.onOut = function(event) {
				// we put this here so the onOver animation won't happen as soon as we place something (mouse is over the pick)
				if (firstOut) {
					interaction.onOver = function(event) {
						obj.playAnimation(activateAnim);
					}
					firstOut = false;
				} else {
					obj.playAnimation(deactivateAnim).onAnimEnd = () -> {
						obj.playAnimation(idleAnim);
					};
				}
			}
		}
		/*
			var cubeGeometry = new h3d.prim.Cube(1, 1, 1, true);
			// move the origin to the bottom of the cube
			cubeGeometry.translate(0, 0, 0.5);
			cubeGeometry.addNormals();
			cubeGeometry.addUVs();
			var cube = new h3d.scene.Mesh(cubeGeometry, s3d);
			cube.x = 0;
			cube.y = 0;
			cube.z = 0;
			cube.material.color.load(h3d.Vector4.fromColor(0xff0000));
		 */
		// cache.loadLibrary(hxd.Res.models.wooden_chest);
		// var chestLib = hxd.Res.models.wooden_chest_glb.toHmd();
		/*
			var modelLib = cache.loadLibrary(hxd.Res.models.tree);
			var model = modelLib.makeObject((texturePath:String) -> {
				var filename = Path.withoutDirectory(texturePath);
				texturePath = Path.join(['models', 'textures', filename]);
				try {
					var texResource = hxd.Res.loader.load(texturePath);
					if (texResource == null) {
						trace('Unable to find texture: ', texturePath);
						return null;
					}
					return texResource.toTexture();
				} catch (e) {
					// trace(e);
					trace("FAIL");
				}
				return null;
			});
		 */
		// var chestModel = hxd.Res.loader.load("models/wooden_chest.glb").toModel();
		// var m = loadLibraryData(res);
		// return m.lib.makeObject(texturePath -> loadTexture(res, texturePath));
		// var chest = cache.loadModel(chestModel);
		// var chestLib = chestModel.toHmd();
		// var chestLib = hxd.Res.models.wooden_chest_glb
		// var chest = cache.loadModel(this.chestModel);
		/*
				(tex) -> {
				trace(tex);
				var t = hxd.Res.load(tex);
				return t.toTexture();
			});
		 */

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

		/*
			modelLib = cache.loadLibrary(hxd.Res.models.wooden_chest_glb);
			model = modelLib.makeObject((texturePath:String) -> {
				var filename = Path.withoutDirectory(texturePath);
				texturePath = Path.join(['models', 'textures', filename]);
				var tex = hxd.Res.loader.load(texturePath).toTexture();
				return tex;
			});
		 */
		/*
			// snow particles
			var parts = new h3d.parts.GpuParticles(s3d);
			var g = parts.addGroup();
			g.size = 0.2;
			g.gravity = 1;
			g.life = 10;
			g.nparts = 10000;
			g.emitMode = CameraBounds;
			parts.volumeBounds = h3d.col.Bounds.fromValues(-20, -20, 15, 40, 40, 40);
		 */
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
		this.cameraController = new OrthoCameraController(s3d);
		this.cameraController.loadFromCamera();
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
		trace('Resizing to $w x $h');
	}

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
}

package tests;

#if (js)
import js.Browser;
#end
import h3d.scene.fwd.DirLight;
import h3d.Vector;
import h3d.prim.Grid;
import h3d.prim.Plane2D;
import haxe.Exception;
import RemotePak;
import haxe.macro.Expr.Error;
import hxd.Math;

// PARAM=-D resourcesPath=../../skin_res
class ModelTest extends hxd.App {
	var interactives:Array<h3d.scene.Interactive> = [];
	var showDebug = false;

	var rnd:hxd.Rand;
	var sun:h3d.scene.fwd.DirLight;
	var obj:h3d.scene.Object;
	var b:h2d.Interactive;

	function initInteract(i:h3d.scene.Interactive, m:h3d.scene.Mesh) {
		var beacon = null;
		var color = m.material.color.clone();
		i.bestMatch = true;
		i.onOver = function(e:hxd.Event) {
			// m.material.color.set(0, 1, 0);
			var s = new h3d.prim.Sphere(1, 64, 32);
			s.addNormals();
			beacon = new h3d.scene.Mesh(s, s3d);
			beacon.material.mainPass.enableLights = true;
			beacon.material.color.set(1, 0, 0);
			beacon.scale(1);
			beacon.x = e.relX;
			beacon.y = e.relY;
			beacon.z = e.relZ;
		};

		i.onMove = i.onCheck = function(e:hxd.Event) {
			if (beacon == null)
				return;
			beacon.x = e.relX;
			beacon.y = e.relY;
			beacon.z = e.relZ;
		};
		i.onOut = function(e:hxd.Event) {
			// m.material.color.load(color);
			beacon.remove();
			beacon = null;
		};
		interactives.push(i);
		if (showDebug)
			i.showDebug = showDebug;
	}

	override function init() {
		var dirLight = new DirLight(new Vector(0.5, 0.5, -0.5), s3d);
		dirLight.enableSpecular = true;

		// sun = new h3d.scene.fwd.DirLight(new h3d.Vector(0.3, -0.4, -0.9), s3d);
		// sun.enableSpecular = false;
		// sun.color.set(1, 1, 1);

		cast(s3d.lightSystem, h3d.scene.fwd.LightSystem).ambientLight.set(0.3, 0.3, 0.3);

		// new AxesHelper(s3d);
		new GridHelper(s3d, 100, 32);

		rnd = new hxd.Rand(5);

		// A grid
		{
			var c = new Grid(100, 100, 1, 1);
			// c.unindex();
			c.addNormals();
			c.addUVs();

			var m = new h3d.scene.Mesh(c, s3d);
			m.setPosition(-c.width / 2, -c.height / 2, 0);
			m.material.mainPass.enableLights = true;

			m.material.shadows = true;
			// var c = 0.3 + rnd.rand() * 0.3;
			// var color = new h3d.Vector(c, c * 0.6, c * 0.6);
			m.material.color.set(0.067, 0.149, 0.224);

			var col = m.getBounds();
			var interact = new h3d.scene.Interactive(col, s3d);
			initInteract(interact, m);
		}

		/*
			for (i in 0...8) {
				var c = if (rnd.random(2) == 0) new h3d.prim.Cube() else new h3d.prim.Sphere(1, 30, 20);
				// c.unindex();
				c.addNormals();
				c.addUVs();
				var m = new h3d.scene.Mesh(c, s3d);
				m.x = rnd.srand() * 0.9;
				m.y = rnd.srand() * 0.9;
				m.scale(0.25 + rnd.rand() * 0.3);
				if (i & 1 == 0)
					m.rotate(0.25, 0.5, 0.8);
				m.material.mainPass.enableLights = true;

				m.material.shadows = true;
				var c = 0.3 + rnd.rand() * 0.3;
				var color = new h3d.Vector(c, c * 0.6, c * 0.6);
				m.material.color.load(color);

				var interact = new h3d.scene.Interactive(m.getCollider(), s3d);
				initInteract(interact, m);
			}

			// A cylinder with a capsule collider
			{
				var cradius = 0.5;
				var cheight = 1;
				var c = new h3d.prim.Cylinder(20, cradius, cheight);
				// c.unindex();
				c.addNormals();
				c.addUVs();
				var m = new h3d.scene.Mesh(c, s3d);
				m.y = 1.2;
				m.scale(0.25 + rnd.rand() * 0.3);
				m.rotate(-0.25, -0.5, -0.8);
				m.material.mainPass.enableLights = true;

				m.material.shadows = true;
				var c = 0.3 + rnd.rand() * 0.3;
				var color = new h3d.Vector(c, c * 0.6, c * 0.6);
				m.material.color.load(color);

				var p1 = new h3d.col.Point(0, 0, cheight);
				var p2 = new h3d.col.Point(0, 0, 0);
				var col = new h3d.col.Capsule(p1, p2, cradius);

				var interact = new h3d.scene.Interactive(new h3d.col.ObjectCollider(m, col), s3d);
				initInteract(interact, m);
			}

			// A sphere with bounds (box/square collider)
			{
				var c = new h3d.prim.Sphere(0.5, 15, 10);
				// c.unindex();
				c.addNormals();
				c.addUVs();
				var m = new h3d.scene.Mesh(c, s3d);
				m.x = 0.3;
				m.y = -1.2;
				m.material.mainPass.enableLights = true;

				m.material.shadows = true;
				var c = 0.3 + rnd.rand() * 0.3;
				var color = new h3d.Vector(c, c * 0.6, c * 0.6);
				m.material.color.load(color);

				var col = m.getBounds();
				var interact = new h3d.scene.Interactive(col, s3d);
				initInteract(interact, m);
			}
		 */

		function getModelResourceFromName(name:String):hxd.res.Model {
			var modelPath = 'models/$name.fbx';
			try {
				var model:hxd.res.Model = hxd.Res.loader.loadCache(modelPath, hxd.res.Model);
				return model;
			} catch (e) {
				trace('Failed to load model resource: $modelPath ($e)');
				return null;
			}
		}

		/*
			function loadModel(name:String):h3d.scene.Object {
				try {
					var model = getModelResourceFromPath(modelPath);
					var obj = modelCache.loadModel(model);
					return obj;
				} catch (e:Exception) {}
			}
			function loadAnimation(name:String, ?animationName:String):h3d.anim.Animation {
				try {
					var modelPath = 'models/$name.fbx';
					var model:hxd.res.Model = hxd.Res.loader.loadCache(modelPath, hxd.res.Model);
					var anim = modelCache.loadAnimation(model, animationName);
					return anim;
				} catch (e:Exception) {
					trace('Failed to load animation: $modelPath:$animationName ($e)');
					return null;
				}
			}
		 */

		var modelCache = new h3d.prim.ModelCache();
		var cultist = getModelResourceFromName('cultist');
		obj = modelCache.loadModel(cultist);
		var materials = obj.getMaterials();
		for (m in materials) {
			m.shadows = false;
			m.castShadows = false;
			m.receiveShadows = false;
			if (m.name == 'blobShadow') {
				m.blendMode = h3d.mat.BlendMode.Alpha;
			}
		};
		// obj.scale(1 / 20);
		// obj.rotate(0, 0, Math.PI / 2);
		// obj.y = 0.2;
		// obj.z = 0.2;
		obj.setPosition(0, 0, 0);
		s3d.addChild(obj);
		var animRun = modelCache.loadAnimation(cultist, "gangnamstyle-dance-loop");
		animRun.speed = 1.0;
		obj.playAnimation(animRun);
		for (o in obj) {
			var m = o.toMesh();
			var i = new h3d.scene.Interactive(m.getCollider(), s3d);

			initInteract(i, m);
		}

		/*
			// 2d square
			b = new h2d.Interactive(150, 100, s2d);
			b.backgroundColor = 0x80204060;
			b.rotation = Math.PI / 3;
			// b.scaleX = 1.5; // TODO
			var pix = null;

			b.onOver = function(e) {
				var t = h2d.Tile.fromColor(0xFF0000, 3, 3);
				t.dx = -1;
				t.dy = -1;
				pix = new h2d.Bitmap(t, b);
				pix.x = e.relX;
				pix.y = e.relY;
			};

			b.onMove = function(e) {
				if (pix == null)
					return;
				pix.x = e.relX;
				pix.y = e.relY;
			}

			b.onOut = function(e) {
				pix.remove();
				pix = null;
			};
		 */
		/*
			addCheck("Show Debug Colliders", function() {
				return showDebug;
			}, function(v) {
				setDebug(v);
			});
		 */
		s3d.camera.pos.set(500, 500, 500);
		// s3d.camera.setFovX(70, s3d.camera.screenRatio);
		new h3d.scene.CameraController(s3d).loadFromCamera();
		// camControl.set(500, Math.degToRad(45), Math.degToRad(45)); // , ?theta:Float, ?phi:Float, ?target:h3d.col.Point, ?fovY:Float) {

		onResize();
	}

	function setDebug(showDebug) {
		this.showDebug = showDebug;
		for (i in interactives)
			i.showDebug = showDebug;
	}

	override function onResize() {
		if (b != null) {
			b.x = (s2d.width >> 1) - 200;
			b.y = 150;
		}
	}

	override function update(dt:Float) {
		// obj.rotate(0, 0, 0.12 * dt);
	}

	static final useRemotePak:Bool = true;

	static public function main() {
		#if js
		trace('Running in JS!');
		var window = new hxd.Window(cast Browser.document.getElementById('renderCanvas'), true);
		window.setCurrent();
		#end

		if (useRemotePak) {
			RemotePak.initRemotePak();
			// RemotePak.addPakFromUrl("https://dev.whirlinggizmo.com/testbed/hxiso/res/res.pak", function (pakFile) {
			RemotePak.addPakFromUrl("res/res.pak", function(pakFile) {
				new ModelTest();
			}, function(e:String) {
				trace(e);
			});
		} else {
			hxd.Res.initEmbed();
			new ModelTest();
		}
	}
}

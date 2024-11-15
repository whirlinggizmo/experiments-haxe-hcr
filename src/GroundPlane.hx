import h3d.mat.Data.Wrap;
import hxd.fmt.hmd.Data.Material;
import h3d.scene.Object;
import h3d.scene.Mesh;
import h3d.col.Point;
import h3d.prim.Cube;
import h3d.Vector4;

final LMB = 0;
final RMB = 1;
final MMB = 2;

class GroundPlane extends Mesh {
	var interaction:h3d.scene.Interactive;

	public var onOver:hxd.Event->Void;
	public var onOut:hxd.Event->Void;
	public var onClick:hxd.Event->Void;
	public var onPush:hxd.Event->Void;
	public var onRelease:hxd.Event->Void;
	public var onWheel:hxd.Event->Void;
	public var mesh:h3d.scene.Mesh;

	public function new(width:Int, height:Int, parent:Object) {
		var c = new Cube(width, height, 0.1, true);

		/*
			var points = c.points;
				var offsetX = -width / 2;
				var offsetY = -height / 2;
				// var offsetZ = 0;
				for (p in points) {
					p.x += offsetX;
					p.y += offsetY;
					// p.z += offsetZ;
				}
		 */
		c.addNormals();
		c.addUVs();

		var mat = h3d.mat.Material.create();
		mat.color.load(Vector4.fromColor(0xFFFFFF));
		// var t = hxd.Res.images.grid.toTexture();
		var t = hxd.Res.loader.load('images/grid.png').toTexture();
		mat.texture = t;

		// scale the uv's to repeat the texture
		c.uvScale(width / (t.width / 100), height / (t.height / 100));
		mat.texture.wrap = Wrap.Repeat;

		super(c, mat, parent);

		// mesh = new h3d.scene.Mesh(c, s3d);
		// mesh.x = 0;
		// mesh.y = 0;
		// mesh.z = 0;

		// mesh.material.color.load(Vector4.fromColor(0xff0095));

		// Add interaction
		var collider = getCollider();
		interaction = new h3d.scene.Interactive(collider, parent);
		interaction.enableRightButton = true;
		interaction.onOver = function(event) {
			if (onOver != null) {
				onOver(event);
			}
		}
		interaction.onOut = function(event) {
			if (onOut != null) {
				onOut(event);
			}
		}
		interaction.onClick = function(event) {
			if (event.button == MMB) {
				event.propagate = true;
				return;
			}
			if (onClick != null) {
				onClick(event);
			}
		}
		interaction.onPush = function(event) {
			if (event.button == MMB) {
				event.propagate = true;
				return;
			}
			if (onPush != null) {
				onPush(event);
			}
		}
		interaction.onRelease = function(event) {
			if (event.button == MMB) {
				event.propagate = true;
				return;
			}
			if (onRelease != null) {
				onRelease(event);
			}
		}

		interaction.onWheel = function(event) {
			//	if (onWheel != null) {
			//		onWheel(event);
			//	}

			event.propagate = true;
		}
	}
}

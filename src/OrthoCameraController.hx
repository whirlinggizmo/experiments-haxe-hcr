import hxd.Math;
import h3d.scene.RenderContext;
import h3d.scene.CameraController;
import h3d.scene.Object;

final LMB = 0;
final RMB = 1;
final MMB = 2;

class OrthoCameraController extends CameraController {
	var orthoSize:Float;
	var targetOrthoSize:Float;
	var enableRotate:Bool = false;
	var minOrthoSize:Float = 1;
	var maxOrthoSize:Float = 1000;
	var panButton = 2;

	public function new(?distance, ?parent) {
		super(distance, parent);
		name = "OrthoCameraConroller";
		targetOrthoSize = orthoSize = 20;
	}

	public function setOrthoSize(s:Float, animate:Bool = true) {
		targetOrthoSize = s;
		if (!animate) {
			orthoSize = targetOrthoSize;
		}
	}

	override public function loadFromCamera(animate = false) {
		var scene = if (scene == null) getScene() else scene;
		if (scene == null)
			throw "Not in scene";

		// get the ortogonal size so we can adjust "zoom" for the orthogonal camera
		orthoSize = scene.camera.orthoBounds?.yMax;
		targetOrthoSize = orthoSize;

		super.loadFromCamera(animate);
	}

	override function rot(dx:Float, dy:Float) {
		// disable rotation
		if (enableRotate) {
			super.rot(dx, dy);
		} else {
			moveX = 0;
			moveY = 0;
		}
	}

	override function syncCamera() {
		if (enableZoom) {
			var cam = getScene().camera;
			if (cam.orthoBounds != null) {
				cam.orthoBounds.xMin = -orthoSize * cam.screenRatio;
				cam.orthoBounds.xMax = orthoSize * cam.screenRatio;
				cam.orthoBounds.yMin = -orthoSize;
				cam.orthoBounds.yMax = orthoSize;
				cam.orthoBounds.zMin = cam.zNear;
				cam.orthoBounds.zMax = cam.zFar;
			}
		}
		super.syncCamera();
	}

	override function sync(ctx:RenderContext) {
		var dt = hxd.Math.min(1, 1 - Math.pow(smooth, ctx.elapsedTime * 60));
		var cam = scene.camera;

		orthoSize = hxd.Math.lerp(orthoSize, targetOrthoSize, dt);

		super.sync(ctx);
		// trace("OrthoCameraController.sync");
	}

	override function zoom(delta:Float) {
		var cam = getScene().camera;

		if (enableZoom && cam.orthoBounds != null) {
			var sz = targetOrthoSize;
			// if ((sz > minOrthoSize && delta < 0) || (sz < maxOrthoSize && delta > 0)) {
			targetOrthoSize *= Math.pow(zoomAmount, delta);
			// var expectedOrthoSize = targetOrthoSize;
			// clamp targetOrthoSize to the min/max orthosize
			targetOrthoSize = Math.clamp(targetOrthoSize, minOrthoSize, maxOrthoSize);
			/*
				if (expectedOrthoSize < minOrthoSize) {
					targetOrthoSize = minOrthoSize * targetOffset.w;
				}
				if (expectedOrthoSize > maxOrthoSize) {
					targetOrthoSize = maxOrthoSize * targetOffset.w;
				}
			 */
			// }
		} else {
			super.zoom(delta);
		}
	}

	override function onEvent(e:hxd.Event) {
		var p:Object = this;
		while (p != null) {
			if (!p.visible) {
				e.propagate = true;
				return;
			}
			p = p.parent;
		}

		switch (e.kind) {
			case EWheel:
				if (hxd.Key.isDown(hxd.Key.CTRL))
					fov(e.wheelDelta * fovZoomAmount * 2);
				else
					zoom(e.wheelDelta);
			case EPush:
				@:privateAccess scene.events.startCapture(onEvent, function() {
					pushing = -1;
					var wnd = hxd.Window.getInstance();
					wnd.setCursorPos(Std.int(pushStartX), Std.int(pushStartY));
					wnd.mouseMode = Absolute;
				}, e.touchId);
				pushing = e.button;
				pushTime = haxe.Timer.stamp();
				pushStartX = pushX = e.relX;
				pushStartY = pushY = e.relY;
				hxd.Window.getInstance().mouseMode = AbsoluteUnbound(true);
			case ERelease, EReleaseOutside:
				if (pushing == e.button) {
					pushing = -1;
					var wnd = hxd.Window.getInstance();
					@:privateAccess scene.events.stopCapture();
					if (e.kind == ERelease
						&& haxe.Timer.stamp() - pushTime < 0.2
						&& hxd.Math.distance(e.relX - pushStartX, e.relY - pushStartY) < 5)
						onClick(e);
				}
			case EMove:
				switch (pushing) {
					case LMB:
						/*
							if( hxd.Key.isDown(hxd.Key.ALT) )
								zoom(-((e.relX - pushX) +  (e.relY - pushY)) * 0.03);
							else
								rot(e.relX - pushX, e.relY - pushY);
							pushX = e.relX;
							pushY = e.relY;
						 */
					case MMB:
						var m = 0.001 * curPos.x * panSpeed / 25;
						pan(-(e.relX - pushX) * m, (e.relY - pushY) * m);
						pushX = e.relX;
						pushY = e.relY;
					case RMB:
						/*
							rot(e.relX - pushX, e.relY - pushY);
							pushX = e.relX;
							pushY = e.relY;
						 */
					default:
				}
			default:
		}
	}
}

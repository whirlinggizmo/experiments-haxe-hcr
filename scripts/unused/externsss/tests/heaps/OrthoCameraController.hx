package tests.heaps;

import h3d.scene.CameraController;

@:native("test.heaps.OrthoCameraController") 
extern class OrthoCameraController extends CameraController {
	public function new(?distance:Float, ?parent:h3d.scene.Object):Void;
}
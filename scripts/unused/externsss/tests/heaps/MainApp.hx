package tests.heaps;

@:native("test.heaps.MainApp")
extern class MainApp  {
	var s3d:h3d.scene.Scene;
	var s2d:h2d.Scene;
	var engine:h3d.Engine;
	static public var instance:MainApp;
	public function createObjectFromLibrary(modelLib:hxd.fmt.hmd.Library):h3d.scene.Object;
	public function loadModelLibrary(modelName:String):hxd.fmt.hmd.Library;
}

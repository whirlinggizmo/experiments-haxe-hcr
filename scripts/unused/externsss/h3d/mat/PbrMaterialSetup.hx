package h3d.mat;

@:native("h3d.mat.PbrMaterialSetup") extern class PbrMaterialSetup extends h3d.mat.MaterialSetup {
	function new(?name:String):Void;
	override function createRenderer():h3d.scene.Renderer;
	override function createLightSystem():h3d.scene.pbr.LightSystem;
	override function createMaterial():h3d.mat.Material;
	static function set():Void;
}
package h3d.anim;

@:native("h3d.anim.SimpleBlend") extern class SimpleBlend extends h3d.anim.Transition {
	function new(anim1:h3d.anim.Animation, anim2:h3d.anim.Animation, objects:Map<String, Bool>):Void;
	var objectsMap : Map<String, Bool>;
	override function createInstance(base:h3d.scene.Object):h3d.anim.SimpleBlend;
}
package h3d.anim;

@:native("h3d.anim.Transition") extern class Transition extends h3d.anim.Animation {
	function new(transitionName:String, anim1:h3d.anim.Animation, anim2:h3d.anim.Animation):Void;
	var anim1 : h3d.anim.Animation;
	var anim2 : h3d.anim.Animation;
	override function unbind(objectName:String):Void;
	override function setFrame(f:Float):Void;
	override function sync(?decompose:Bool):Void;
	override function bind(base:h3d.scene.Object):Void;
	override function update(dt:Float):Float;
}
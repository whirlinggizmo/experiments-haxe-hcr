package h3d.anim;

@:native("h3d.anim.SmoothTarget") extern class SmoothTarget extends h3d.anim.Animation {
	function new(target:h3d.anim.Animation, ?duration:Float):Void;
	var target : h3d.anim.Animation;
	var blend : Float;
	var duration : Float;
	var ignoreTranslate : Bool;
	var easing : Float;
	override function update(dt:Float):Float;
	override function setFrame(f:Float):Void;
	override function getEvents():Array<Array<String>>;
	@:noDebug
	override function sync(?decompose:Bool):Void;
}
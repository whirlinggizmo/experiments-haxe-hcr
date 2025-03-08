package h3d.anim;

@:native("h3d.anim.SmoothTransition") extern class SmoothedObject extends h3d.anim.Animation.AnimatedObject {
	function new(name:String):Void;
	var tmpMatrix : h3d.Matrix;
	var outMatrix : h3d.Matrix;
	var isAnim1 : Bool;
	var isAnim2 : Bool;
	var def : h3d.Matrix;
}

@:native("h3d.anim.SmoothTransition") extern class SmoothTransition extends h3d.anim.Transition {
	function new(current:h3d.anim.Animation, target:h3d.anim.Animation, duration:Float):Void;
	var blendFactor : Float;
	override function bind(base:h3d.scene.Object):Void;
	@:access(h3d.scene.Skin)
	override function sync(?decompose:Bool):Void;
	override function update(dt:Float):Float;
}
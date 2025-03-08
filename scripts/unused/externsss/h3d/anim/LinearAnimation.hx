package h3d.anim;

@:native("h3d.anim.LinearAnimation") extern class LinearFrame {
	function new():Void;
	var tx : Float;
	var ty : Float;
	var tz : Float;
	var qx : Float;
	var qy : Float;
	var qz : Float;
	var qw : Float;
	var sx : Float;
	var sy : Float;
	var sz : Float;
	function toMatrix():h3d.Matrix;
}

@:native("h3d.anim.LinearAnimation") extern class LinearObject extends h3d.anim.Animation.AnimatedObject {
	function new(name:String):Void;
	var hasPosition : Bool;
	var hasRotation : Bool;
	var hasScale : Bool;
	var frames : haxe.ds.Vector<h3d.anim.LinearAnimation.LinearFrame>;
	var alphas : haxe.ds.Vector<Float>;
	var uvs : haxe.ds.Vector<Float>;
	var propName : String;
	var propValues : haxe.ds.Vector<Float>;
	var matrix : h3d.Matrix;
	var propCurrentValue : Float;
	override function clone():h3d.anim.Animation.AnimatedObject;
}

@:native("h3d.anim.LinearAnimation") extern class LinearAnimation extends h3d.anim.Animation {
	function new(name:String, frame:Int, sampling:Float):Void;
	function addCurve(objName:String, frames:haxe.ds.Vector<h3d.anim.LinearAnimation.LinearFrame>, hasPos:Bool, hasRot:Bool, hasScale:Bool):Void;
	function addAlphaCurve(objName:String, alphas:haxe.ds.Vector<Float>):Void;
	function addUVCurve(objName:String, uvs:haxe.ds.Vector<Float>):Void;
	function addPropCurve(objName:String, propName:String, values:haxe.ds.Vector<Float>):Void;
	override function getPropValue(objName:String, propName:String):Float;
	@:access(h3d.scene.Skin)
	@:noDebug
	override function sync(?decompose:Bool):Void;
}
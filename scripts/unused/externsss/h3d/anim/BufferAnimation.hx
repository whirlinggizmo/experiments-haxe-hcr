package h3d.anim;

@:native("h3d.anim.BufferAnimation") extern enum DataLayout {
	Position;
	Rotation;
	Scale;
	UV;
	Alpha;
	Property;
	SingleFrame;
}

@:native("h3d.anim.BufferAnimation") extern class BufferObject extends h3d.anim.Animation.AnimatedObject {
	function new(objectName:String, dataOffset:Int):Void;
	var layout : haxe.EnumFlags<h3d.anim.BufferAnimation.DataLayout>;
	var dataOffset : Int;
	var propCurrentValue : Float;
	var propName : String;
	var matrix : h3d.Matrix;
	function getStride():Int;
	override function clone():h3d.anim.Animation.AnimatedObject;
}

@:native("h3d.anim.BufferAnimation") extern class BufferAnimation extends h3d.anim.Animation {
	function new(name:String, frame:Int, sampling:Float):Void;
	function setData(data:hxd.impl.TypedArray.Float32Array, stride:Int):Void;
	function addObject(objName:String, offset:Int):h3d.anim.BufferAnimation.BufferObject;
	override function getPropValue(objName:String, propName:String):Float;
	@:access(h3d.scene.Skin)
	@:noDebug
	override function sync(?decompose:Bool):Void;
}
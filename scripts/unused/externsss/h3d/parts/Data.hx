package h3d.parts;

@:native("h3d.parts.Data") extern enum Value {
	VConst(v:Float);
	VLinear(start:Float, len:Float);
	VPow(start:Float, len:Float, pow:Float);
	VSin(freq:Float, ampl:Float, offset:Float);
	VCos(freq:Float, ampl:Float, offset:Float);
	VPoly(values:Array<Float>, points:Array<Float>);
	VRandom(start:Float, len:Float, converge:h3d.parts.Data.Converge);
	VCustom(p:h3d.parts.Particle -> Float);
}

@:native("h3d.parts.Data") extern enum Converge {
	No;
	Start;
	End;
}

@:native("h3d.parts.Data") extern enum Shape {
	SLine(size:h3d.parts.Data.Value);
	SSphere(radius:h3d.parts.Data.Value);
	SCone(radius:h3d.parts.Data.Value, angle:h3d.parts.Data.Value);
	SDisc(radius:h3d.parts.Data.Value);
	SCustom(initPartPosDir:(h3d.parts.Emitter, h3d.parts.Particle) -> Void);
}

@:native("h3d.parts.Data") extern class ValueXYZ {
	function new(x:h3d.parts.Data.Value, y:h3d.parts.Data.Value, z:h3d.parts.Data.Value):Void;
	var vx : h3d.parts.Data.Value;
	var vy : h3d.parts.Data.Value;
	var vz : h3d.parts.Data.Value;
}

@:native("h3d.parts.Data") extern class ColorKey {
	function new(time:Float, r:Float, g:Float, b:Float):Void;
	var time : Float;
	var r : Float;
	var g : Float;
	var b : Float;
	var next : h3d.parts.Data.ColorKey;
}

@:native("h3d.parts.Data") extern enum BlendMode {
	Add;
	Alpha;
	SoftAdd;
}

@:native("h3d.parts.Data") extern enum SortMode {
	Front;
	Back;
	Sort;
	InvSort;
}

interface Randomized {
	function rand():Float;
}

@:native("h3d.parts.Data") extern class State {
	function new():Void;
	var textureName : String;
	var frames : Array<h2d.Tile>;
	var blendMode : h3d.parts.Data.BlendMode;
	var sortMode : h3d.parts.Data.SortMode;
	var is3D : Bool;
	var isAlphaMap : Bool;
	var loop : Bool;
	var emitRate : h3d.parts.Data.Value;
	var bursts : Array<{ public var time(default, default) : Float; public var count(default, default) : Int; }>;
	var maxParts : Int;
	var shape : h3d.parts.Data.Shape;
	var emitFromShell : Bool;
	var emitLocal : Bool;
	var emitTrail : Bool;
	var randomDir : Bool;
	var globalLife : Float;
	var globalSpeed : h3d.parts.Data.Value;
	var globalSize : h3d.parts.Data.Value;
	var life : h3d.parts.Data.Value;
	var size : h3d.parts.Data.Value;
	var ratio : h3d.parts.Data.Value;
	var rotation : h3d.parts.Data.Value;
	var speed : h3d.parts.Data.Value;
	var gravity : h3d.parts.Data.Value;
	var force : h3d.parts.Data.ValueXYZ;
	var colors : Array<{ public var time(default, default) : Float; public var color(default, default) : Int; }>;
	var light : h3d.parts.Data.Value;
	var alpha : h3d.parts.Data.Value;
	var collide : Bool;
	var collideKill : Bool;
	var bounce : Float;
	var frame : h3d.parts.Data.Value;
	var delay : Float;
	var update : h3d.parts.Particle -> Void;
	function setDefaults():Void;
	@:noDebug
	function scale(val:h3d.parts.Data.Value, v:Float):h3d.parts.Data.Value;
	function initFrames():Void;
	static var defPartAlpha : hxd.res.Any;
	static var defPart : hxd.res.Any;
	static function load(b:haxe.io.Bytes, loadTexture:String -> h2d.Tile):h3d.parts.Data.State;
}
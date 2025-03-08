package h3d.parts;

@:native("h3d.parts.Particle") extern class Particle implements h3d.parts.Data.Randomized {
	function new():Void;
	var x : Float;
	var y : Float;
	var z : Float;
	var r : Float;
	var g : Float;
	var b : Float;
	var a : Float;
	var alpha(get, set) : Float;
	var frame : Int;
	var size : Float;
	var ratio : Float;
	var rotation : Float;
	var prev : h3d.parts.Particle;
	var next : h3d.parts.Particle;
	var time : Float;
	var lifeTimeFactor : Float;
	var dx : Float;
	var dy : Float;
	var dz : Float;
	var fx : Float;
	var fy : Float;
	var fz : Float;
	var randIndex : Int;
	var randValues : Array<Float>;
	function setColor(color:Int, ?alpha:Float):Void;
	function remove():Void;
	function rand():Float;
}
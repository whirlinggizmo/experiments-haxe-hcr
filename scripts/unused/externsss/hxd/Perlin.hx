package hxd;

@:native("hxd.Perlin") extern class Perlin {
	function new():Void;
	var repeat : Int;
	/**
		 Keep result in the [-1, 1] range 
	**/
	var normalize : Bool;
	function adjustScale(size:Int, scale:Float):Float;
	function gradient3D(seed:Int, x:Float, y:Float, z:Float):Float;
	function gradient1D(seed:Int, x:Float):Float;
	function gradient(seed:Int, x:Float, y:Float):Float;
	function perlin(seed:Int, x:Float, y:Float, octaves:Int, ?persist:Float, ?lacunarity:Float):Float;
	function perlin1D(seed:Int, x:Float, octaves:Int, ?persist:Float, ?lacunarity:Float):Float;
	function ridged(seed:Int, x:Float, y:Float, octaves:Int, ?offset:Float, ?gain:Float, ?persist:Float, ?lacunarity:Float):Float;
	/**
		
				Converts a desired probability in the [0,1] range into the corresponding perlin value that we must test against for threshold.
			
	**/
	function thresholdValue(p:Float):Float;
	function maxValue(octaves:Int, persist:Float):Float;
}
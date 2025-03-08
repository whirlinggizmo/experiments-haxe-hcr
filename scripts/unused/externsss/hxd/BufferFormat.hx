package hxd;

@:native("hxd.BufferFormat") extern class BufferFormat {
	var uid(default, null) : Int;
	var stride(default, null) : Int;
	var strideBytes(default, null) : Int;
	var hasLowPrecision(default, null) : Bool;
	function getInput(name:String):hxd.BufferFormat.BufferInput;
	function getCompressed():hxd.BufferFormat;
	function calculateInputOffset(name:String):Int;
	function hasInput(name:String, ?type:hxd.BufferFormat.InputFormat):Bool;
	function append(name:String, type:hxd.BufferFormat.InputFormat):hxd.BufferFormat;
	function pop():hxd.BufferFormat;
	function isSubSet(fmt:hxd.BufferFormat):Bool;
	function resolveMapping(target:hxd.BufferFormat):Array<hxd.BufferFormat.BufferMapping>;
	function toString():String;
	/**
		
				Alias for XY_UV_RGBA
			
	**/
	static var H2D(get, never) : hxd.BufferFormat;
	static var XY_UV_RGBA(get, null) : hxd.BufferFormat;
	static var XY_UV(get, null) : hxd.BufferFormat;
	static var POS3D(get, null) : hxd.BufferFormat;
	static var POS3D_NORMAL(get, null) : hxd.BufferFormat;
	static var POS3D_UV(get, null) : hxd.BufferFormat;
	static var POS3D_NORMAL_UV(get, null) : hxd.BufferFormat;
	static var POS3D_NORMAL_UV_RGBA(get, null) : hxd.BufferFormat;
	static var VEC4_DATA(get, null) : hxd.BufferFormat;
	static var INDEX16(get, null) : hxd.BufferFormat;
	static var INDEX32(get, null) : hxd.BufferFormat;
	private static function get_XY_UV_RGBA():hxd.BufferFormat;
	private static function get_XY_UV():hxd.BufferFormat;
	private static function get_POS3D():hxd.BufferFormat;
	private static function get_POS3D_NORMAL():hxd.BufferFormat;
	private static function get_POS3D_NORMAL_UV():hxd.BufferFormat;
	private static function get_POS3D_NORMAL_UV_RGBA():hxd.BufferFormat;
	private static function get_POS3D_UV():hxd.BufferFormat;
	private static function get_VEC4_DATA():hxd.BufferFormat;
	private static function get_INDEX16():hxd.BufferFormat;
	private static function get_INDEX32():hxd.BufferFormat;
	static function fromID(uid:Int):hxd.BufferFormat;
	static function make(inputs:Array<hxd.BufferFormat.BufferInput>):hxd.BufferFormat;
	static function float32to16(v:Float, ?denormalsAreZero:Bool):Int;
	static function float16to32(v:Int):Float;
	static function float32toS8(v:Float):Int;
	static function floatS8to32(v:Int):Float;
	static function float32toU8(v:Float):Int;
}

@:structInit @:native("hxd.BufferFormat") extern class BufferInput {
	var name(default, null) : String;
	var type(default, null) : hxd.BufferFormat.InputFormat;
	var precision(default, null) : hxd.BufferFormat.Precision;
}

@:enum typedef Precision = Int;

@:enum typedef InputFormat = Int;

typedef BufferMapping = Int;

typedef MultiFormatCache = Map<Int, { public var nexts(default, default) : hxd.BufferFormat.MultiFormatCache; public var found(default, default) : hxd.BufferFormat.MultiFormat; }>;

@:native("hxd.BufferFormat") extern class MultiFormat {
	var uid(default, null) : Int;
	static var MAX_FORMATS : Int;
	static function make(formats:Array<hxd.BufferFormat>):hxd.BufferFormat.MultiFormat;
}
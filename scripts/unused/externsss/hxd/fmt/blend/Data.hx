package hxd.fmt.blend;

@:native("hxd.fmt.blend.Data") extern class Blend {
	function new(bytes:haxe.io.Bytes):Void;
	var pos : Int;
	var version : String;
	var pointerSize : Int;
	var littleEndian : Bool;
	var blocks : Array<hxd.fmt.blend.Data.Block>;
	var dna : hxd.fmt.blend.Data.Dna;
	function dir(type:String):Array<String>;
	function get(type:String):Array<hxd.fmt.blend.Data.Handle>;
	function read8():Int;
	var read16 : () -> Int;
	var read32 : () -> Int;
	function readString():String;
	function readChars(len:Int):String;
	function readChar():String;
	static function getStruct(dna:hxd.fmt.blend.Data.Dna, typeIndex:Int):hxd.fmt.blend.Data.DnaStruct;
	static function getTypeIndex(dna:hxd.fmt.blend.Data.Dna, type:String):Int;
}

@:native("hxd.fmt.blend.Data") extern class Block {
	function new():Void;
	var blend : hxd.fmt.blend.Data.Blend;
	var code : String;
	var size : Int;
	var sdnaIndex : Int;
	var count : Int;
	var pos : Int;
}

@:native("hxd.fmt.blend.Data") extern class Dna {
	function new():Void;
	var names : Array<String>;
	var types : Array<String>;
	var typesLength : Array<Int>;
	var structs : Array<hxd.fmt.blend.Data.DnaStruct>;
}

@:native("hxd.fmt.blend.Data") extern class DnaStruct {
	function new():Void;
	var dna : hxd.fmt.blend.Data.Dna;
	var type : Int;
	var fieldTypes : Array<Int>;
	var fieldNames : Array<Int>;
}

@:native("hxd.fmt.blend.Data") extern class Handle {
	function new():Void;
	var block : hxd.fmt.blend.Data.Block;
	var offset : Int;
	var ds : hxd.fmt.blend.Data.DnaStruct;
	function get(name:String):Dynamic;
}
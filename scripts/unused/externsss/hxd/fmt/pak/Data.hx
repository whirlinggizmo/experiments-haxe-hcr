package hxd.fmt.pak;

@:native("hxd.fmt.pak.Data") extern class File {
	function new():Void;
	var name : String;
	var isDirectory : Bool;
	var content : Array<hxd.fmt.pak.Data.File>;
	var dataPosition : Float;
	var dataSize : Int;
	var checksum : Int;
}

@:native("hxd.fmt.pak.Data") extern class Data {
	function new():Void;
	var version : Int;
	var root : hxd.fmt.pak.Data.File;
	var headerSize : Int;
	var dataSize : Int;
}
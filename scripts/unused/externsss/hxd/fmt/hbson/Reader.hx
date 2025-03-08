package hxd.fmt.hbson;

@:native("hxd.fmt.hbson.Reader") extern class Reader {
	function new(data:haxe.io.Bytes, globalStrings:Bool):Void;
	function read():Dynamic;
}
package hxd.fmt.pak;

@:native("hxd.fmt.pak.Reader") extern class Reader {
	function new(i:haxe.io.Input):Void;
	function readHeader():hxd.fmt.pak.Data;
}
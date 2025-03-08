package hxd.fmt.hmd;

@:native("hxd.fmt.hmd.Reader") extern class Reader {
	function new(i:haxe.io.Input):Void;
	function readHeader(?fast:Bool):hxd.fmt.hmd.Data;
	function read():hxd.fmt.hmd.Data;
}
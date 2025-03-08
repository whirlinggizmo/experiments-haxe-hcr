package hxd.fmt.grd;

@:native("hxd.fmt.grd.Reader") extern class Reader {
	function new(i:haxe.io.Input):Void;
	function read():hxd.fmt.grd.Data;
}
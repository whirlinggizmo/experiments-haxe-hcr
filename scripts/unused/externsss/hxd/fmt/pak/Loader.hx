package hxd.fmt.pak;

@:native("hxd.fmt.pak.Loader") extern class Loader extends h2d.Object {
	function new(s2d:h2d.Scene, onDone:() -> Void):Void;
}
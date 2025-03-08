package hxd.fmt.hbson;

@:native("hxd.fmt.hbson.Writer") extern class Writer {
	function new(out:haxe.io.Output):Void;
	function write(json:Dynamic):Void;
}
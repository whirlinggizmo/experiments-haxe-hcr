package hxd.fmt.hmd;

@:native("hxd.fmt.hmd.Writer") extern class Writer {
	function new(out:haxe.io.Output):Void;
	function write(d:hxd.fmt.hmd.Data):Void;
}
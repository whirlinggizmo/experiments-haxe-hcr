package hxd.fmt.bfnt;

@:access(h2d.Font) @:native("hxd.fmt.bfnt.Writer") extern class Writer {
	function new(out:haxe.io.Output):Void;
	function write(font:h2d.Font):Void;
}
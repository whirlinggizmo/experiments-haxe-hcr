package hxd.fmt.pak;

@:native("hxd.fmt.pak.Writer") extern class Writer {
	function new(o:haxe.io.Output, ?align:Int):Void;
	function writeFile(f:hxd.fmt.pak.Data.File):Void;
	function write(pak:hxd.fmt.pak.Data, content:haxe.io.Bytes, ?arrayContent:Array<haxe.io.Bytes>):Void;
}
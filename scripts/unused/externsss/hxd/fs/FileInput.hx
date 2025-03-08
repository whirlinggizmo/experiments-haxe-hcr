package hxd.fs;

@:native("hxd.fs.FileInput") extern class FileInput extends haxe.io.Input {
	function fetch(?dataSize:Int):Void;
	function skip(nbytes:Int):Void;
	override function readByte():Int;
	override function readBytes(b:haxe.io.Bytes, pos:Int, len:Int):Int;
	override function close():Void;
}
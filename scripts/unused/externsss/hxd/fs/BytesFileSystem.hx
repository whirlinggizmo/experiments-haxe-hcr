package hxd.fs;

@:native("hxd.fs.BytesFileSystem") extern class BytesFileSystem implements hxd.fs.FileSystem {
	function getRoot():hxd.fs.FileEntry;
	function exists(path:String):Bool;
	function get(path:String):hxd.fs.BytesFileSystem.BytesFileEntry;
	function dispose():Void;
	function dir(path:String):Array<hxd.fs.FileEntry>;
}

@:native("hxd.fs.BytesFileSystem") extern class BytesFileEntry extends hxd.fs.FileEntry {
	function new(path:String, bytes:haxe.io.Bytes):Void;
	override function getBytes():haxe.io.Bytes;
	override function readBytes(out:haxe.io.Bytes, outPos:Int, pos:Int, len:Int):Int;
	override function load(?onReady:() -> Void):Void;
	override function loadBitmap(onLoaded:hxd.fs.LoadedBitmap -> Void):Void;
	override function exists(name:String):Bool;
	override function get(name:String):hxd.fs.FileEntry;
	override function iterator():hxd.impl.ArrayIterator_hxd_fs_FileEntry;
}
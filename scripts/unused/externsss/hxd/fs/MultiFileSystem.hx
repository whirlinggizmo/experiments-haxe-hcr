package hxd.fs;

@:native("hxd.fs.MultiFileSystem") extern class MultiFileSystem implements hxd.fs.FileSystem {
	function new(fs:Array<hxd.fs.FileSystem>):Void;
	var fs : Array<hxd.fs.FileSystem>;
	function getRoot():MultiFileEntry;
	function get(path:String):hxd.fs.FileEntry;
	function exists(path:String):Bool;
	function dispose():Void;
	function dir(path:String):Array<hxd.fs.FileEntry>;
}
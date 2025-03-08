package hxd.fs;

@:native("hxd.fs.LocalFileSystem") extern class LocalFileSystem implements hxd.fs.FileSystem {
	function new(dir:String):Void;
	var baseDir(default, null) : String;
	function exists(path:String):Bool;
	function get(path:String):hxd.fs.FileEntry;
	function getRoot():hxd.fs.FileEntry;
	function dispose():Void;
	function dir(path:String):Array<hxd.fs.FileEntry>;
}
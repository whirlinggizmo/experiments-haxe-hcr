package hxd.fs;

@:native("hxd.fs.EmbedFileSystem") extern class EmbedFileSystem implements hxd.fs.FileSystem {
	function getRoot():hxd.fs.FileEntry;
	function exists(path:String):Bool;
	function get(path:String):EmbedEntry;
	function dispose():Void;
	function dir(path:String):Array<hxd.fs.FileEntry>;
	static function create(?basePath:Dynamic, ?options:Dynamic):Dynamic;
}
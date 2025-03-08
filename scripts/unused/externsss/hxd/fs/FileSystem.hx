package hxd.fs;

interface FileSystem {
	function getRoot():hxd.fs.FileEntry;
	function get(path:String):hxd.fs.FileEntry;
	function exists(path:String):Bool;
	function dispose():Void;
	function dir(path:String):Array<hxd.fs.FileEntry>;
}
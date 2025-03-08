package hxd.res;

@:native("hxd.res.Loader") extern class Loader {
	function new(fs:hxd.fs.FileSystem):Void;
	var fs(default, null) : hxd.fs.FileSystem;
	function cleanCache():Void;
	function dir(path:String):Array<hxd.res.Any>;
	function exists(path:String):Bool;
	function load(path:String):hxd.res.Any;
	function loadCache<T:(hxd.res.Resource)>(path:String, c:Class<T>):T;
	function dispose():Void;
	/**
		
				Set when initializing hxd.Res, or manually.
				Allows code to resolve resources without compiling hxd.Res
			
	**/
	static var currentInstance : hxd.res.Loader;
}
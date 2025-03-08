package hxd.res;

@:native("hxd.res.Resource") extern class Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	var name(get, never) : String;
	var entry(default, null) : hxd.fs.FileEntry;
	function watch(onChanged:() -> Void):Void;
	static var LIVE_UPDATE : Bool;
}
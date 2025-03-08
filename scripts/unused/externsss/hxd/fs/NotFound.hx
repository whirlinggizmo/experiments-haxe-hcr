package hxd.fs;

@:native("hxd.fs.NotFound") extern class NotFound {
	function new(path:String):Void;
	var path : String;
}
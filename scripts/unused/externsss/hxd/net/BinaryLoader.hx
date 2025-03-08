package hxd.net;

@:native("hxd.net.BinaryLoader") extern class BinaryLoader {
	function new(url:String):Void;
	var url(default, null) : String;
	function onLoaded(bytes:haxe.io.Bytes):Void;
	function onProgress(cur:Int, max:Int):Void;
	function onError(msg:String):Void;
	function load():Void;
}
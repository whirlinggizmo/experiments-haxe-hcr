package hxd.snd;

@:native("hxd.snd.Mp3Data") extern class Mp3Data extends hxd.snd.Data {
	function new(bytes:haxe.io.Bytes):Void;
	override function isLoading():Bool;
	override function load(onEnd:() -> Void):Void;
}
package hxsl;

@:native("hxsl.Globals") extern class Globals {
	function new():Void;
	function set(path:String, v:Dynamic):Void;
	function get(path:String):Dynamic;
	function allocChannelID(t:h3d.mat.Texture):Int;
	static function allocID(path:String):Int;
	static function getIDName(id:Int):String;
}

typedef GlobalSlot<T> = Int;
package hxd.impl;

@:native("hxd.impl.Properties") extern class Properties {
	function getField(obj:Dynamic, f:String):Dynamic;
	function setField(obj:Dynamic, f:String, value:Dynamic):Void;
	function apply(props:Dynamic, obj:Dynamic):Void;
}
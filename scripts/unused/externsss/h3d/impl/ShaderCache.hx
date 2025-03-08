package h3d.impl;

@:native("h3d.impl.ShaderCache") extern class ShaderCache {
	function new(file:String, ?outputFile:String):Void;
	var keepSource : Bool;
	function disableSave():Void;
	function initEmpty():Void;
	function resolveShaderBinary(source:String, ?configurationKey:String):haxe.io.Bytes;
	function saveCompiledShader(source:String, bytes:haxe.io.Bytes, ?configurationKey:String, ?saveToFile:Bool):Void;
}
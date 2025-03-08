package hxsl;

@:native("hxsl.ShaderList") extern class ShaderList {
	function new(s:hxsl.Shader, ?n:hxsl.ShaderList):Void;
	var s : hxsl.Shader;
	var next : hxsl.ShaderList;
	function clone():hxsl.ShaderList;
	static function addSort(s:hxsl.Shader, shaders:hxsl.ShaderList):hxsl.ShaderList;
	static var MAX_LIST_SIZE : Int;
	static var ALLOW_DUPLICATES : Bool;
}
package hxsl;

@:native("hxsl.Serializer") extern class Serializer {
	function new():Void;
	function unserialize(data:String):hxsl.Ast.ShaderData;
	function serialize(s:hxsl.Ast.ShaderData):String;
	static function run(s:hxsl.Ast.ShaderData):String;
}
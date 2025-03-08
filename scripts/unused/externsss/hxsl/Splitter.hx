package hxsl;

@:native("hxsl.Splitter") extern class Splitter {
	function new():Void;
	function split(s:hxsl.Ast.ShaderData, isBatchShader:Bool):Array<hxsl.Ast.ShaderData>;
}
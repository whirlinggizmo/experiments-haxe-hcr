package hxsl;

@:native("hxsl.Dce") extern class Dce {
	function new():Void;
	function dce(shaders:Array<hxsl.Ast.ShaderData>):Array<hxsl.Ast.ShaderData>;
}
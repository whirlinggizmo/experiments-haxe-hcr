package hxsl;

@:native("hxsl.Linker") extern class Linker {
	function new(mode:hxsl.RuntimeShader.LinkMode):Void;
	var allVars : Array<AllocatedVar>;
	function link(shadersData:Array<hxsl.Ast.ShaderData>):hxsl.Ast.ShaderData;
}
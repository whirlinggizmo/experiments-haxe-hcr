package hxsl;

@:native("hxsl.Flatten") extern enum ARead {
	AIndex(a:Alloc);
	AOffset(a:Alloc, stride:Int, delta:hxsl.Ast.TExpr);
}

@:native("hxsl.Flatten") extern class Flatten {
	function new():Void;
	var allocData : Map<hxsl.Ast.TVar, Array<Alloc>>;
	function flatten(s:hxsl.Ast.ShaderData, kind:hxsl.Ast.FunctionKind):hxsl.Ast.ShaderData;
}
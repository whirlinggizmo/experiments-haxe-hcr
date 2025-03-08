package hxsl;

/**
 Type Checker : will take an untyped Expr and turn it into a typed TExpr, resolving identifiers and ensuring type safety.
 */
/**
	
		Type Checker : will take an untyped Expr and turn it into a typed TExpr, resolving identifiers and ensuring type safety.
	
**/
@:native("hxsl.Checker") extern class Checker {
	function new():Void;
	var inits : Array<{ public var v(default, default) : hxsl.Ast.TVar; public var e(default, default) : hxsl.Ast.TExpr; }>;
	function warning(msg:String, pos:hxsl.Ast.Position):Void;
	function loadShader(path:String):hxsl.Ast.Expr;
	function check(name:String, shader:hxsl.Ast.Expr):hxsl.Ast.ShaderData;
}
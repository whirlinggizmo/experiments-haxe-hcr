package hxsl;

@:native("hxsl.MacroParser") extern class MacroParser {
	function new():Void;
	function parseType(t:haxe.macro.Expr.ComplexType, pos:haxe.macro.Expr.Position):hxsl.Ast.Type;
	function parseExpr(e:haxe.macro.Expr):hxsl.Ast.Expr;
}
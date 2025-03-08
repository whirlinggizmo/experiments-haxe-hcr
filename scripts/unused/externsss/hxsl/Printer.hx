package hxsl;

@:native("hxsl.Printer") extern class Printer {
	function new(?varId:Bool):Void;
	function shaderString(s:hxsl.Ast.ShaderData):String;
	function varString(v:hxsl.Ast.TVar):String;
	function funString(f:hxsl.Ast.TFunction):String;
	function exprString(e:hxsl.Ast.TExpr):String;
	static function opStr(op:hxsl.Ast.Binop):String;
	static function toString(e:hxsl.Ast.TExpr, ?varId:Bool):String;
	static function shaderToString(s:hxsl.Ast.ShaderData, ?varId:Bool):String;
	static function check(s:hxsl.Ast.ShaderData, ?from:Array<hxsl.Ast.ShaderData>):Void;
}
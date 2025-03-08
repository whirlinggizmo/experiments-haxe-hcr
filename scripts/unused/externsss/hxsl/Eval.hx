package hxsl;

/**
 Evaluator : will substitute some variables (usually constants) by their runtime value and will
 evaluate and reduce the expression, unroll loops, etc.
 */
/**
	
		Evaluator : will substitute some variables (usually constants) by their runtime value and will
		evaluate and reduce the expression, unroll loops, etc.
	
**/
@:native("hxsl.Eval") extern class Eval {
	function new():Void;
	var varMap : Map<hxsl.Ast.TVar, hxsl.Ast.TVar>;
	var inlineCalls : Bool;
	var unrollLoops : Bool;
	var eliminateConditionals : Bool;
	function setConstant(v:hxsl.Ast.TVar, c:hxsl.Ast.Const):Void;
	function eval(s:hxsl.Ast.ShaderData):hxsl.Ast.ShaderData;
}
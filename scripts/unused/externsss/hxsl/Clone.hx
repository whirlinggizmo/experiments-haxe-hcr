package hxsl;

@:native("hxsl.Clone") extern class Clone {
	function new():Void;
	var varMap : Map<Int, hxsl.Ast.TVar>;
	function tvar(v:hxsl.Ast.TVar):hxsl.Ast.TVar;
	function tfun(f:hxsl.Ast.TFunction):hxsl.Ast.TFunction;
	function ttype(t:hxsl.Ast.Type):hxsl.Ast.Type;
	function texpr(e:hxsl.Ast.TExpr):hxsl.Ast.TExpr;
	function shader(s:hxsl.Ast.ShaderData):hxsl.Ast.ShaderData;
	static function shaderData(s:hxsl.Ast.ShaderData):hxsl.Ast.ShaderData;
}
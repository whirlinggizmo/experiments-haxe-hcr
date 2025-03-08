package hxsl;

@:native("hxsl.SharedShader") extern class ShaderInstance {
	function new(shader:hxsl.Ast.ShaderData):Void;
	var id : Int;
	var shader : hxsl.Ast.ShaderData;
	var params : Map<Int, Int>;
}

@:native("hxsl.SharedShader") extern class ShaderGlobal {
	function new(v:hxsl.Ast.TVar, gid:Int):Void;
	var v : hxsl.Ast.TVar;
	var globalId : Int;
}

@:native("hxsl.SharedShader") extern class ShaderConst {
	function new(v:hxsl.Ast.TVar, pos:Int, bits:Int):Void;
	var v : hxsl.Ast.TVar;
	var pos : Int;
	var bits : Int;
	var globalId : Int;
	var next : hxsl.SharedShader.ShaderConst;
}

@:native("hxsl.SharedShader") extern class SharedShader {
	function new(src:String, ?module:String):Void;
	var data : hxsl.Ast.ShaderData;
	var globals : Array<hxsl.SharedShader.ShaderGlobal>;
	var consts : hxsl.SharedShader.ShaderConst;
	static var UNROLL_LOOPS : Bool;
	static function compactMem<T>(mem:T):T;
}
package hxsl;

@:native("hxsl.RuntimeShader") extern enum LinkMode {
	Default;
	Batch;
	Compute;
}

@:native("hxsl.RuntimeShader") extern class AllocParam {
	function new(name:String, pos:Int, instance:Int, index:Int, type:hxsl.Ast.Type):Void;
	var name : String;
	var pos : Int;
	var instance : Int;
	var index : Int;
	var type : hxsl.Ast.Type;
	var perObjectGlobal : hxsl.RuntimeShader.AllocGlobal;
	var next : hxsl.RuntimeShader.AllocParam;
	function clone(?resetGID:Bool):hxsl.RuntimeShader.AllocParam;
}

@:native("hxsl.RuntimeShader") extern class AllocGlobal {
	function new(pos:Int, path:String, type:hxsl.Ast.Type):Void;
	var pos : Int;
	var gid : Int;
	var path : String;
	var type : hxsl.Ast.Type;
	var next : hxsl.RuntimeShader.AllocGlobal;
	function clone(?resetGID:Bool):hxsl.RuntimeShader.AllocGlobal;
}

@:native("hxsl.RuntimeShader") extern class RuntimeShaderData {
	function new():Void;
	var kind : hxsl.Ast.FunctionKind;
	var data : hxsl.Ast.ShaderData;
	var code : String;
	var params : hxsl.RuntimeShader.AllocParam;
	var paramsSize : Int;
	var globals : hxsl.RuntimeShader.AllocGlobal;
	var globalsSize : Int;
	var textures : hxsl.RuntimeShader.AllocParam;
	var texturesCount : Int;
	var buffers : hxsl.RuntimeShader.AllocParam;
	var bufferCount : Int;
}

@:native("hxsl.RuntimeShader") extern class ShaderInstanceDesc {
	function new(shader:hxsl.SharedShader, bits:Int):Void;
	var shader : hxsl.SharedShader;
	var bits : Int;
	var index : Int;
}

@:native("hxsl.RuntimeShader") extern class RuntimeShader {
	function new():Void;
	var id : Int;
	var vertex : hxsl.RuntimeShader.RuntimeShaderData;
	var fragment : hxsl.RuntimeShader.RuntimeShaderData;
	var compute(get, set) : hxsl.RuntimeShader.RuntimeShaderData;
	var globals : Map<Int, Bool>;
	/**
		
				Signature of the resulting HxSL code.
				Several shaders with the different specification might still get the same resulting signature.
			
	**/
	var signature : String;
	var mode : hxsl.RuntimeShader.LinkMode;
	var spec : { var instances : Array<hxsl.RuntimeShader.ShaderInstanceDesc>; var signature : String; };
	function getShaders():Array<hxsl.RuntimeShader.RuntimeShaderData>;
}
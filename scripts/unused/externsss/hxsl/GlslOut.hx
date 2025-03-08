package hxsl;

@:native("hxsl.GlslOut") extern class GlslOut {
	function new():Void;
	var varNames : Map<Int, String>;
	var glES : Float;
	var version : Int;
	function run(s:hxsl.Ast.ShaderData):String;
	/**
		
						In Heaps and DirectX, vertex output Z position is in [0,1] range
						Whereas in OpenGL it's [-1, 1].
						Given we have either [X, Y, 0, N] for zNear or [X, Y, F, F] for zFar,
						this shader operation will map [0, 1] range to [-1, 1] for correct clipping.
					
	**/
	static function compile(s:hxsl.Ast.ShaderData):String;
}
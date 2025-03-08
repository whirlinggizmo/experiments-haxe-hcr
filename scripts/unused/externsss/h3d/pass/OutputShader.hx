package h3d.pass;

@:native("h3d.pass.OutputShader") extern class OutputShader {
	function new(?output:Array<hxsl.Output>):Void;
	function setOutput(?output:Array<hxsl.Output>):Void;
	function compileShaders(globals:hxsl.Globals, shaders:hxsl.ShaderList, ?mode:hxsl.RuntimeShader.LinkMode):hxsl.RuntimeShader;
}
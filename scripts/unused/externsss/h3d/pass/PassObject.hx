package h3d.pass;

@:native("h3d.pass.PassObject") extern class PassObject {
	@:noCompletion
	var next : h3d.pass.PassObject;
	var pass : h3d.mat.Pass;
	var obj : h3d.scene.Object;
	var index : Int;
	var shaders : hxsl.ShaderList;
	var shader : hxsl.RuntimeShader;
	var depth : Float;
	var texture : Int;
}
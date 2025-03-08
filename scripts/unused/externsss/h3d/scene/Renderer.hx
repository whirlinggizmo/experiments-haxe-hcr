package h3d.scene;

@:native("h3d.scene.Renderer") extern class PassObjects {
	function new():Void;
	var name : String;
	var passes : h3d.pass.PassList;
	var rendered : Bool;
}

@:native("h3d.scene.Renderer") extern enum RenderMode {
	Default;
	LightProbe;
}

@:allow(hrt.prefab.rfx.RendererFX) @:allow(h3d.pass.Shadows) @:native("h3d.scene.Renderer") extern class Renderer extends hxd.impl.AnyProps {
	function new():Void;
	var effects : Array<h3d.impl.RendererFX>;
	var renderMode : h3d.scene.Renderer.RenderMode;
	var shadows : Bool;
	function getEffect<T:(h3d.impl.RendererFX)>(cl:Class<T>):T;
	function dispose():Void;
	/**
		
				Inject a post process shader for the current frame. Shaders are reset after each render.
			
	**/
	function addShader(s:hxsl.Shader):Void;
	function getPass<T:(h3d.pass.Output)>(c:Class<T>):T;
	function getPassByName(name:String):h3d.pass.Output;
	function start():Void;
	function startEffects():Void;
	function process(passes:Array<h3d.scene.Renderer.PassObjects>):Void;
	function computeDispatch(shader:hxsl.Shader, ?x:Int, ?y:Int, ?z:Int):Void;
}
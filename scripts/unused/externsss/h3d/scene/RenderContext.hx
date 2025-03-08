package h3d.scene;

@:native("h3d.scene.RenderContext") extern class RenderContext extends h3d.impl.RenderContext {
	function new(scene:h3d.scene.Scene):Void;
	var camera(default, null) : h3d.Camera;
	var scene(default, null) : h3d.scene.Scene;
	var drawPass : h3d.pass.PassObject;
	var pbrLightPass : h3d.mat.Pass;
	var computingStatic : Bool;
	var computeVelocity : Bool;
	var lightSystem : h3d.scene.LightSystem;
	var extraShaders : hxsl.ShaderList;
	var visibleFlag : Bool;
	var debugCulling : Bool;
	var wasContextLost : Bool;
	var cullingCollider : h3d.col.Collider;
	var forcedScreenRatio : Float;
	function setCamera(cam:h3d.Camera):Void;
	function setupTarget():Void;
	function start():Void;
	function emitPass(pass:h3d.mat.Pass, obj:h3d.scene.Object):h3d.pass.PassObject;
	function allocShaderList(s:hxsl.Shader, ?next:hxsl.ShaderList):hxsl.ShaderList;
	function computeList(list:hxsl.ShaderList):Void;
	function computeDispatch(?shader:hxsl.Shader, ?x:Int, ?y:Int, ?z:Int):Void;
	function emitLight(l:h3d.scene.Light):Void;
	function getCameraFrustumBuffer():h3d.Buffer;
	function uploadParams():Void;
	function done():Void;
	override function dispose():Void;
}
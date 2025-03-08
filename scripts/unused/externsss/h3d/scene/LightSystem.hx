package h3d.scene;

@:native("h3d.scene.LightSystem") extern class LightSystem {
	function new():Void;
	var drawPasses : Int;
	var shadowLight : h3d.scene.Light;
	function initGlobals(globals:hxsl.Globals):Void;
	function initLights(ctx:h3d.scene.RenderContext):Void;
	function computeLight(obj:h3d.scene.Object, shaders:hxsl.ShaderList):hxsl.ShaderList;
	function dispose():Void;
}
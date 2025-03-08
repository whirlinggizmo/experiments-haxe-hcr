package h3d.impl;

@:native("h3d.impl.RenderContext") extern class RenderContext {
	var engine : h3d.Engine;
	var time : Float;
	var elapsedTime : Float;
	var frame : Int;
	var textures : h3d.impl.TextureCache;
	var globals : hxsl.Globals;
	var shaderBuffers : Dynamic;
	function setCurrent():Void;
	function clearCurrent():Void;
	function dispose():Void;
	function fillGlobals(buf:Dynamic, s:hxsl.RuntimeShader):Void;
	function fillParams(buf:Dynamic, s:hxsl.RuntimeShader, shaders:hxsl.ShaderList, ?compute:Bool):Void;
	static var STRICT : Bool;
	static function get():h3d.impl.RenderContext;
}
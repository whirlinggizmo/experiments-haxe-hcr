package h3d.pass;

@:native("h3d.pass.Shadows") extern class Shadows extends h3d.pass.Output {
	function new(light:h3d.scene.Light):Void;
	var enabled(default, set) : Bool;
	var mode(default, set) : h3d.pass.Shadows.RenderMode;
	var size(default, set) : Int;
	var shader(default, null) : hxsl.Shader;
	var blur : h3d.pass.Blur;
	var samplingKind : h3d.pass.Shadows.ShadowSamplingKind;
	var power : Float;
	var bias : Float;
	var pcfQuality : Int;
	var pcfScale : Float;
	private function set_mode(m:h3d.pass.Shadows.RenderMode):h3d.pass.Shadows.RenderMode;
	private function set_enabled(b:Bool):Bool;
	private function set_size(s:Int):Int;
	override function dispose():Void;
	function getShadowProj():h3d.Matrix;
	function getShadowTex():h3d.mat.Texture;
	function loadStaticData(bytes:haxe.io.Bytes):Bool;
	function saveStaticData():haxe.io.Bytes;
	function computeStatic(passes:h3d.pass.PassList):Void;
	/**
		
			 * Triggers update of static part of shadows (if any).
			
	**/
	function needStaticUpdate():Void;
}

@:native("h3d.pass.Shadows") extern enum RenderMode {
	None;
	Static;
	Dynamic;
	Mixed;
}

@:native("h3d.pass.Shadows") extern enum ShadowSamplingKind {
	None;
	PCF;
	ESM;
}
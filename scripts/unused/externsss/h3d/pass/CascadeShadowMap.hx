package h3d.pass;

typedef CascadeParams = {
	var depthBias : Float;
	var slopeBias : Float;
};

typedef CascadeCamera = {
	var offset : h3d.Vector4;
	var orthoBounds : h3d.col.Bounds;
	var scale : h3d.Vector4;
	var viewProj : h3d.Matrix;
};

@:native("h3d.pass.CascadeShadowMap") extern class CascadeShadowMap extends h3d.pass.DirShadowMap {
	function new(light:h3d.scene.Light):Void;
	var cascadeViewProj : h3d.Matrix;
	var params : Array<h3d.pass.CascadeShadowMap.CascadeParams>;
	var pow : Float;
	var minPixelSize : Int;
	var firstCascadeSize : Float;
	var castingMaxDist : Float;
	var transitionFraction : Float;
	var cascade(default, set) : Int;
	var highPrecision : Bool;
	function set_cascade(v:Int):Int;
	var debugShader : Bool;
	override function getShadowTex():hxsl.Types.TextureChannel;
	function getShadowTextures():Array<hxsl.Types.Texture>;
	override function needStaticUpdate():Void;
	function calcCascadeMatrices():Void;
	function getCascadeProj(i:Int):h3d.Matrix;
	function getCascadeOffset(i:Int):h3d.Vector4;
	function getCascadeScale(i:Int):h3d.Vector4;
	override function getShadowProj():h3d.Matrix;
	function customCullPasses(passes:h3d.pass.PassList, frustum:h3d.col.Frustum, i:Int, minSize:Float):Void;
	override function draw(passes:h3d.pass.PassList, ?sort:h3d.pass.PassList -> Void):Void;
}
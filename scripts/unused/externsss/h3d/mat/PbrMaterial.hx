package h3d.mat;

@:enum typedef PbrMode = String;

@:enum typedef PbrBlend = String;

@:enum typedef PbrDepthTest = String;

@:enum typedef PbrDepthWrite = String;

@:enum typedef PbrStencilOp = String;

@:enum typedef PbrStencilCompare = String;

@:enum typedef PbrCullingMode = String;

typedef PbrProps = {
	@:optional
	var alphaKill : Bool;
	var blend : h3d.mat.PbrMaterial.PbrBlend;
	var colorMask : Int;
	var culling : h3d.mat.PbrMaterial.PbrCullingMode;
	@:optional
	var depthFailOp : h3d.mat.PbrMaterial.PbrStencilOp;
	@:optional
	var depthPrepass : Bool;
	var depthTest : h3d.mat.PbrMaterial.PbrDepthTest;
	@:optional
	var depthWrite : h3d.mat.PbrMaterial.PbrDepthWrite;
	@:optional
	var drawOrder : String;
	@:optional
	var emissive : Float;
	var enableStencil : Bool;
	@:optional
	var flipBackFaceNormal : Bool;
	@:optional
	var ignoreCollide : Bool;
	var mode : h3d.mat.PbrMaterial.PbrMode;
	@:optional
	var parallax : Float;
	@:optional
	var parallaxSteps : Int;
	var shadows : Bool;
	@:optional
	var stencilCompare : h3d.mat.PbrMaterial.PbrStencilCompare;
	@:optional
	var stencilFailOp : h3d.mat.PbrMaterial.PbrStencilOp;
	@:optional
	var stencilPassOp : h3d.mat.PbrMaterial.PbrStencilOp;
	@:optional
	var stencilReadMask : Int;
	@:optional
	var stencilValue : Int;
	@:optional
	var stencilWriteMask : Int;
	@:optional
	var textureWrap : Bool;
};

@:native("h3d.mat.PbrMaterial") extern class PbrMaterial extends h3d.mat.Material {
	function new(?texture:h3d.mat.Texture):Void;
	override function getDefaultProps(?type:String):Any;
	override function getDefaultModelProps():Any;
	override function refreshProps():Void;
	override function clone(?m:h3d.mat.BaseMaterial):h3d.mat.BaseMaterial;
}
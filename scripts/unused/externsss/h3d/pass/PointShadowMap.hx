package h3d.pass;

@:native("h3d.pass.PointShadowMap") extern class PointShadowMap extends h3d.pass.CubeShadowMap {
	function new(light:h3d.scene.Light, useWorldDist:Bool):Void;
	override function getShadowTex():hxsl.Types.Texture;
}
package h3d.pass;

@:native("h3d.pass.CapsuleShadowMap") extern class CapsuleShadowMap extends h3d.pass.CubeShadowMap {
	function new(light:h3d.scene.Light, useWorldDist:Bool):Void;
	override function getShadowTex():hxsl.Types.Texture;
}
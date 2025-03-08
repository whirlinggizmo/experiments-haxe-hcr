package h3d.pass;

@:native("h3d.pass.SpotShadowMap") extern class SpotShadowMap extends h3d.pass.Shadows {
	function new(light:h3d.scene.Light):Void;
	override function dispose():Void;
	override function getShadowTex():hxsl.Types.TextureChannel;
	override function saveStaticData():haxe.io.Bytes;
	override function loadStaticData(bytes:haxe.io.Bytes):Bool;
	override function draw(passes:h3d.pass.PassList, ?sort:h3d.pass.PassList -> Void):Void;
	override function computeStatic(passes:h3d.pass.PassList):Void;
}
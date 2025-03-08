package h3d.pass;

@:native("h3d.pass.CubeShadowMap") extern class CubeShadowMap extends h3d.pass.Shadows {
	function new(light:h3d.scene.Light, useWorldDist:Bool):Void;
	var faceMask(default, null) : haxe.EnumFlags<h3d.pass.CubeShadowMap.CubeFaceFlag>;
	override function dispose():Void;
	override function saveStaticData():haxe.io.Bytes;
	override function loadStaticData(bytes:haxe.io.Bytes):Bool;
	override function draw(passes:h3d.pass.PassList, ?sort:h3d.pass.PassList -> Void):Void;
	override function computeStatic(passes:h3d.pass.PassList):Void;
}

@:native("h3d.pass.CubeShadowMap") extern enum CubeFaceFlag {
	Right;
	Left;
	Back;
	Front;
	Top;
	Bottom;
}
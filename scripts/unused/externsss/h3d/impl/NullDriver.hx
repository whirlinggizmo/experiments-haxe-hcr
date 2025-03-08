package h3d.impl;

@:native("h3d.impl.NullDriver") extern class NullDriver extends h3d.impl.Driver {
	function new():Void;
	override function hasFeature(f:h3d.impl.Driver.Feature):Bool;
	override function isSupportedFormat(fmt:h3d.mat.Data.TextureFormat):Bool;
	override function isDisposed():Bool;
	override function getDriverName(details:Bool):String;
	override function init(onCreate:Bool -> Void, ?forceSoftware:Bool):Void;
	override function selectShader(shader:hxsl.RuntimeShader):Bool;
	override function allocTexture(t:h3d.mat.Texture):h3d.impl.Driver.Texture;
	override function allocBuffer(b:h3d.Buffer):h3d.impl.Driver.GPUBuffer;
}
package h3d.mat;

@:native("h3d.mat.TextureChannels") extern class TextureChannels extends h3d.mat.Texture {
	function new(w:Int, h:Int, ?flags:Array<h3d.mat.Data.TextureFlags>, ?format:h3d.mat.Data.TextureFormat):Void;
	var allowAsync : Bool;
	function setResource(c:hxd.Pixels.Channel, res:hxd.res.Image, ?srcChannel:hxd.Pixels.Channel):Void;
}
package h3d.impl;

@:native("h3d.impl.TextureCache") extern class TextureCache {
	function new():Void;
	var defaultFormat : hxd.PixelFormat;
	function getNamed(name:String):h3d.mat.Texture;
	function set(t:h3d.mat.Texture, index:Int):Void;
	function begin():Void;
	function allocTarget(name:String, width:Int, height:Int, ?defaultDepth:Bool, ?format:hxd.PixelFormat, ?flags:Array<h3d.mat.Data.TextureFlags>):h3d.mat.Texture;
	function allocTargetScale(name:String, scale:Float, ?defaultDepth:Bool, ?format:hxd.PixelFormat):h3d.mat.Texture;
	function allocTileTarget(name:String, tile:h2d.Tile, ?defaultDepth:Bool, ?format:hxd.PixelFormat):h3d.mat.Texture;
	function dispose():Void;
}
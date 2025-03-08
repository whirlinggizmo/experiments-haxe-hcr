package hxd.res;

@:native("hxd.res.Gradients") extern class Gradients extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	function toTexture(name:String, ?resolution:Int):h3d.mat.Texture;
	function toTextureMap(?resolution:Int):Map<String, h3d.mat.Texture>;
	function toTileMap(?resolution:Int):Map<String, h2d.Tile>;
}
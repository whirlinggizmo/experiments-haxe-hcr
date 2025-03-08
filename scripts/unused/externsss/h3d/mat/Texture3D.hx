package h3d.mat;

@:native("h3d.mat.Texture3D") extern class Texture3D extends h3d.mat.Texture {
	function new(w:Int, h:Int, d:Int, ?flags:Array<h3d.mat.Data.TextureFlags>, ?format:h3d.mat.Data.TextureFormat):Void;
	override function clone():h3d.mat.TextureArray;
}
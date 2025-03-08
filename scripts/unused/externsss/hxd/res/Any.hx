package hxd.res;

@:access(hxd.res.Loader) @:native("hxd.res.Any") extern class Any extends hxd.res.Resource {
	function new(loader:hxd.res.Loader, entry:hxd.fs.FileEntry):Void;
	function toModel():hxd.res.Model;
	function toTexture():h3d.mat.Texture;
	function toTile():h2d.Tile;
	function toText():String;
	function toImage():hxd.res.Image;
	function toSound():hxd.res.Sound;
	function toPrefab():hxd.res.Resource;
	function toAnimGraph():hxd.res.Resource;
	function to<T:(hxd.res.Resource)>(c:Class<T>):T;
	static function fromBytes(path:String, bytes:haxe.io.Bytes):hxd.res.Any;
}
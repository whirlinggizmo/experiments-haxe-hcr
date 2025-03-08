package hxd.res;

@:enum typedef ImageFormat = Int;

@:native("hxd.res.Image") extern enum ImageInfoFlag {
	IsCube;
	Dxt10Header;
}

@:allow(hxd.res.Image) @:native("hxd.res.Image") extern class ImageInfo {
	function new():Void;
	var width(default, null) : Int;
	var height(default, null) : Int;
	var mipLevels(default, null) : Int;
	var mipOffset(default, null) : Int;
	var layerCount(default, null) : Int;
	var flags(default, null) : haxe.EnumFlags<hxd.res.Image.ImageInfoFlag>;
	var dataFormat(default, null) : hxd.res.Image.ImageFormat;
	var pixelFormat(default, null) : hxd.PixelFormat;
}

@:native("hxd.res.Image") extern class Image extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	var enableAsyncLoading : Bool;
	function getInfo():hxd.res.Image.ImageInfo;
	function getPixels(?fmt:hxd.PixelFormat, ?index:Int):hxd.Pixels;
	function toBitmap():hxd.BitmapData;
	function toTexture():h3d.mat.Texture;
	function toTile():h2d.Tile;
	/**
		
				Specify if we will automatically convert non-power-of-two textures to power-of-two.
			
	**/
	static var DEFAULT_FILTER : h3d.mat.Data.Filter;
	/**
		
				Reduce textures quality with mipmaps by only loading up to the desired size.
			
	**/
	static var MIPMAP_MAX_SIZE : Int;
	static function customCheckInfo(i:hxd.res.Image):Void;
	static var ASYNC_LOADER : hxd.impl.AsyncLoader;
	static var LOG_TEXTURE_LOAD : Bool;
	static function setupTextureFlags(tex:h3d.mat.Texture):Void;
}
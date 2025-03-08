package hxd.fmt.tiff;

@:native("hxd.fmt.tiff.Writer") extern class Writer {
	function new(f:haxe.io.Output):Void;
	function write(tif:hxd.fmt.tiff.Data.TifFile):Void;
	static function ofPixels(pix:hxd.Pixels):hxd.fmt.tiff.Data.TifFile;
}
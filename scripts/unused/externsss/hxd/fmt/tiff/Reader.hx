package hxd.fmt.tiff;

@:native("hxd.fmt.tiff.Reader") extern class Reader {
	function new(f:hxd.fmt.pak.FileSystem.FileInput):Void;
	function read():hxd.fmt.tiff.Data.TifFile;
	static function decode(f:hxd.fmt.tiff.Data.TifFile):hxd.Pixels;
}
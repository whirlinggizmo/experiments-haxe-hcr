package hxd.fs;

@:native("hxd.fs.SourceLoader") extern class SourceLoader {
	static function isActive():Bool;
	static function resolve(path:String):hxd.fs.FileEntry;
}
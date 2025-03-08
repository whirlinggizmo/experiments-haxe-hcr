package hxd.fmt.pak;

@:native("hxd.fmt.pak.FileSystem") extern enum FileSeekMode {
	SeekBegin;
	SeekEnd;
	SeedCurrent;
}

@:native("hxd.fmt.pak.FileSystem") extern class FileInput extends haxe.io.BytesInput {
	function new(b:haxe.io.Bytes, ?pos:Int, ?len:Int):Void;
	function seek(pos:Int, seekMode:hxd.fmt.pak.FileSystem.FileSeekMode):Void;
	function tell():Int;
}

@:native("hxd.fmt.pak.FileSystem") extern class FileSeek {
	static function seek(f:hxd.fmt.pak.FileSystem.FileInput, pos:Float, mode:hxd.fmt.pak.FileSystem.FileSeekMode):Void;
}

@:native("hxd.fmt.pak.FileSystem") extern class FileSystem implements hxd.fs.FileSystem {
	function new():Void;
	var totalReadBytes : Int;
	var totalReadCount : Int;
	function loadPak(file:String):Void;
	/**
		
				Add the .pak file directly.
		
				This method is intended to be used with single-threaded environment such as HTML5 target,
				as it doesn't have access to sys package.
		
				Use with multi-threaded environment at your own risk.
			
	**/
	function addPak(file:hxd.fmt.pak.FileSystem.FileInput, ?path:String):Void;
	function dispose():Void;
	function getRoot():hxd.fs.FileEntry;
	function get(path:String):hxd.fs.FileEntry;
	function exists(path:String):Bool;
	function dir(path:String):Array<hxd.fs.FileEntry>;
}
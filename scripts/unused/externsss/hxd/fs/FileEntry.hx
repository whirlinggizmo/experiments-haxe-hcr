package hxd.fs;

@:native("hxd.fs.FileEntry") extern class FileEntry {
	var name(default, null) : String;
	var path(get, never) : String;
	var directory(get, never) : String;
	var extension(get, never) : String;
	var size(get, never) : Int;
	var isDirectory(get, never) : Bool;
	var isAvailable(get, never) : Bool;
	function getBytes():haxe.io.Bytes;
	function readBytes(out:haxe.io.Bytes, outPos:Int, pos:Int, len:Int):Int;
	/**
		
				Similar to readBytes except :
				a) a temporary buffer is reused, meaning a single fetchBytes must occur at a single time
				b) it will throw an Eof exception if the data is not available
			
	**/
	function fetchBytes(pos:Int, len:Int):haxe.io.Bytes;
	function readFull(bytes:haxe.io.Bytes, pos:Int, len:Int):Void;
	/**
		
				Read first 4 bytes of the file.
			
	**/
	function getSign():Int;
	function getText():String;
	function open():hxd.fs.FileInput;
	function load(?onReady:() -> Void):Void;
	function loadBitmap(onLoaded:hxd.fs.LoadedBitmap -> Void):Void;
	function watch(onChanged:() -> Void):Void;
	function exists(name:String):Bool;
	function get(name:String):hxd.fs.FileEntry;
	function iterator():hxd.impl.ArrayIterator_hxd_fs_FileEntry;
	private function get_isAvailable():Bool;
	private function get_isDirectory():Bool;
	private function get_size():Int;
	private function get_path():String;
	private function get_directory():String;
	private function get_extension():String;
}
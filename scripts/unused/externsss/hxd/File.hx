package hxd;

typedef BrowseOptions = {
	@:optional
	var defaultPath : String;
	@:optional
	var fileTypes : Array<{ public var name(default, default) : String; public var extensions(default, default) : Array<String>; }>;
	@:optional
	var relativePath : Bool;
	@:optional
	var saveFileName : String -> Void;
	@:optional
	var title : String;
};

/**
 this will be called when saving a file with the target path, if supported
 */
/**
	 this will be called when saving a file with the target path, if supported 
**/
typedef BrowseSelect = {
	/**
		 might contain only the file name without the full path depending on sandbox restrictions 
	**/
	var fileName : String;
	/**
		 allow to load the selected file content 
	**/
	function load(onReady:haxe.io.Bytes -> Void):Void;
};

@:native("hxd.File") extern class File {
	static function browse(onSelect:hxd.File.BrowseSelect -> Void, ?options:hxd.File.BrowseOptions):Void;
	static function saveAs(dataContent:haxe.io.Bytes, ?options:hxd.File.BrowseOptions):Void;
	static function exists(path:String):Bool;
	static function delete(path:String):Void;
	static function listDirectory(path:String):Void;
	static function getBytes(path:String):haxe.io.Bytes;
	static function saveBytes(path:String, data:haxe.io.Bytes):Void;
	static function load(path:String, onLoad:haxe.io.Bytes -> Void, ?onError:String -> Void):Void;
	static function createDirectory(path:String):Void;
}
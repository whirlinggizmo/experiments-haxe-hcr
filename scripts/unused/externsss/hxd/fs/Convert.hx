package hxd.fs;

@:keep @:keepSub @:native("hxd.fs.Convert") extern class Convert {
	function new(sourceExts:String, destExt:String):Void;
	var sourceExts(default, null) : Array<String>;
	var destExt(default, null) : String;
	/**
		
				Major version of the Convert.
				When incremented, all files processed by this Convert would be rebuilt. 
	**/
	var version(default, null) : Int;
	var params : Dynamic;
	var localParams : Dynamic;
	var srcPath : String;
	var dstPath : String;
	var baseDir : String;
	var originalFilename : String;
	var srcBytes : haxe.io.Bytes;
	var hash : String;
	function cleanup():Void;
	function convert():Void;
	/**
		
				A function that should return quickly if the convert might have local params or not.
				Do not have access to: srcBytes, hash.
			
	**/
	function hasLocalParams():Bool;
	function computeLocalParams():Dynamic;
	static function register(c:hxd.fs.Convert):Int;
}
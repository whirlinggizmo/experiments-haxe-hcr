package hxd.res;

/**
 * Intermediate representation of a glyph. Only used while
 * parsing a BDF font file.
 */
/**
	
	 * Intermediate representation of a glyph. Only used while
	 * parsing a BDF font file.
	 
**/
@:native("hxd.res.BDFFont") extern class BDFFontChar {
	function new(code:Int, width:Int, height:Int, xoffset:Int, yoffset:Int, stride:Int):Void;
	var code : Int;
	var x : Int;
	var y : Int;
	var width : Int;
	var height : Int;
	var xoffset : Int;
	var yoffset : Int;
	var stride : Int;
	var bits : Array<Int>;
	static function sortOnHeight(a:hxd.res.BDFFont.BDFFontChar, b:hxd.res.BDFFont.BDFFontChar):Int;
}

/**
 * Parse BDF font format to h2d.Font
 */
/**
	
	 * Parse BDF font format to h2d.Font
	 
**/
@:native("hxd.res.BDFFont") extern class BDFFont extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	/**
		
			 * Convert BDF resource to a h2d.Font instance
			 * @return h2d.Font The font
			 
	**/
	@:access(h2d.Font)
	function toFont():h2d.Font;
}
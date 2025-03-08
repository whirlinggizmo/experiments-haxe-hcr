package hxd.res;

@:native("hxd.res.BitmapFont") extern class BitmapFont extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	/**
		
				Load and cache the font instance.
		
				Because font instance is cached, operations like `resizeTo` should be performed on a copy of the font, to avoid affecting other text fields.
			
	**/
	function toFont():h2d.Font;
	/**
		
				Load and cache Signed Distance Field font with specified size, channel, alphaCutoff and smoothing. ( default : initial size, red, 0.5, -1 )
				For more information on SDF texture generation refer to this page: https://github.com/libgdx/libgdx/wiki/Distance-field-fonts
				For more information on MSDF texture generation refer to this page: https://github.com/Chlumsky/msdfgen
		
				Because font instance is cached, operations like `resizeTo` should be performed on a copy of the font, to avoid affecting other text fields.
		
				@param channel The channel that serves as distance data source.
				@param alphaCutoff The distance value that is considered to be the edge. Usually should be 0.5.
				@param smoothing The smoothing of edge. Lower value lead to sharper edges. Value of -1 sets it to automatic.
			
	**/
	function toSdfFont(?size:Int, ?channel:h2d.Font.SDFChannel, ?alphaCutoff:Float, ?smoothing:Float):h2d.Font;
}
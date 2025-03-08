package h2d;

/**
 A `FontChar` kerning information as well as linked list of kernings. See `FontChar.kerning`.
 */
/**
	
		A `FontChar` kerning information as well as linked list of kernings. See `FontChar.kerning`.
	
**/
@:native("h2d.Font") extern class Kerning {
	/**
		
				Create a new kerning instance.
				@param c The preceding character.
				@param o The kerning offset.
			
	**/
	function new(c:Int, o:Float):Void;
	/**
		
				A character that should precede current character in order to apply this kerning.
			
	**/
	var prevChar : Int;
	/**
		
				A kerning offset between the character pair in pixels.
			
	**/
	var offset : Float;
	/**
		
				The next kerning reference.
			
	**/
	var next : h2d.Font.Kerning;
}

/**
 A single `Font` character descriptor.
 */
/**
	
		A single `Font` character descriptor.
	
**/
@:native("h2d.Font") extern class FontChar {
	/**
		
				Create a new font character.
				@param t The character Tile.
				@param width The horizontal advance of the character.
			
	**/
	function new(t:h2d.Tile, w:Float):Void;
	/**
		
				A Tile representing position of a character on the texture.
			
	**/
	var t : h2d.Tile;
	/**
		
				Horizontal advance value of the character.
		
				On top of advance, letter spacing is affected by `FontChar.kerning` matches and `Text.letterSpacing`.
			
	**/
	var width : Float;
	/**
		
				Adds a new kerning to the character with specified `prevChar` and `offset`.
			
	**/
	function addKerning(prevChar:Int, offset:Int):Void;
	/**
		
				Returns kerning offset for a pair `[prevChar, currentChar]` or `0` if there was no paired kerning value.
			
	**/
	function getKerningOffset(prevChar:Int):Float;
	/**
		
				Clones the character instance.
			
	**/
	function clone():h2d.Font.FontChar;
}

/**
 Channel reading method for `FontType.SignedDistanceField`.
 */
/**
	
		Channel reading method for `FontType.SignedDistanceField`.
	
**/
@:enum typedef SDFChannel = Int;

/**
 The rendering type of the of the `Font` instance.
 */
/**
	
		The rendering type of the of the `Font` instance.
	
**/
@:native("h2d.Font") extern enum FontType {
	/**
		
				A simple raster bitmap font.
			
	**/
	BitmapFont;
	/**
		
				A Signed Distance Field font data. Each glyph pixel contains the distance to the closest glyph edge instead of actual color.
		
				To render an SDF font, `Text` utilizes `h3d.shader.SignedDistanceField` shader to produce smoothed and scalable text.
				Because shader expects texture to use bilinear filtering, Text automatically enables `Drawable.smooth` on itself.
		
				See [Text](https://github.com/HeapsIO/heaps/wiki/Text) manual and [libgdx wiki](https://github.com/libgdx/libgdx/wiki/Distance-field-fonts) for more details.
		
				@param channel The channel that serves as distance data source.
				@param alphaCutoff The distance value that is considered to be the edge. Usually should be 0.5.
				@param smoothing The smoothing of edge. Lower value lead to sharper edges. Value of -1 sets it to automatic.
			
	**/
	SignedDistanceField(channel:h2d.Font.SDFChannel, alphaCutoff:Float, smoothing:Float);
}

/**
 An instance of a text font.
 
 Heaps comes with a default Font that covers basic ASCII characters, and can be retrieved via `hxd.res.DefaultFont.get()`.
 */
/**
	
		An instance of a text font.
	
		Heaps comes with a default Font that covers basic ASCII characters, and can be retrieved via `hxd.res.DefaultFont.get()`.
	
**/
@:native("h2d.Font") extern class Font {
	/**
		
				The font name. Assigned on font creation and can be used to identify font instances.
			
	**/
	var name(default, null) : String;
	/**
		
				Current font size. Font can be resized with `resizeTo`.
			
	**/
	var size(default, null) : Int;
	/**
		
				The baseline value of the font represents the base on which characters will sit.
		
				Used primarily with `HtmlText` to sit multiple fonts and images at the same line.
			
	**/
	var baseLine(default, null) : Float;
	/**
		
				Font line height provides vertical offset for each new line of the text.
			
	**/
	var lineHeight(default, null) : Float;
	/**
		
				Reference to the source Tile containing all glyphs of the Font.
			
	**/
	var tile(default, null) : h2d.Tile;
	/**
		
				The resource path of the source Tile. Either relative to .fnt or to resources root.
			
	**/
	var tilePath(default, null) : String;
	/**
		
				The font type. BitmapFonts rendered as-is, but SDF fonts will use an extra shader to produce scalable smooth fonts.
				See `FontType.SignedDistanceField` for more details.
			
	**/
	var type : h2d.Font.FontType;
	/**
		
				Font charset allows to resolve specific char codes that are not directly present in glyph map as well as detect spaces.
				Defaults to `hxd.Charset.getDefault()`.
			
	**/
	var charset : hxd.Charset;
	/**
		
				Offsets all glyphs by specified amount.
				Affects each glyph `Tile.dx` and `Tile.dy`.
				@param x The X offset of the glyphs.
				@param y The Y offset of the glyphs.
			
	**/
	function setOffset(x:Float, y:Float):Void;
	/**
		
				Creates a copy of the font instance.
			
	**/
	function clone():h2d.Font;
	/**
		
				Resizes the Font instance to specified size.
		
				For BitmapFonts it can be used to create smoother fonts by rasterizing them with double size while still keeping the original glyph size by downscaling the font.
				And SDF fonts can be resized to arbitrary sizes to produce scalable fonts of any size.
		
				@param size The new font size.
			
	**/
	function resizeTo(size:Int):Void;
	/**
		
				Checks if character is present in glyph list.
				Compared to `getChar` does not check if it exists through `Font.charset`.
				@param code The charcode to look up.
			
	**/
	function hasChar(code:Int):Bool;
	/**
		
				Disposes of the Font instance. Equivalent to `Tile.dispose`.
			
	**/
	function dispose():Void;
	/**
		
			 	Calculate a baseLine default value based on available glyphs.
			 
	**/
	function calcBaseLine():Float;
}
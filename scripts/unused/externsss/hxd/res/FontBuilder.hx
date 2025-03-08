package hxd.res;

typedef FontBuildOptions = {
	@:optional
	var antiAliasing : Bool;
	@:optional
	var chars : String;
	@:optional
	var kerning : Bool;
};

/**
 FontBuilder allows to dynamicaly create a Bitmap font from a vector font.
 Depending on the platform this might require the font to be available as part of the resources,
 or it can be embedded manually with hxd.res.Embed.embedFont
 */
/**
	
		FontBuilder allows to dynamicaly create a Bitmap font from a vector font.
		Depending on the platform this might require the font to be available as part of the resources,
		or it can be embedded manually with hxd.res.Embed.embedFont
	
**/
@:access(h2d.Font) @:access(h2d.Tile) @:native("hxd.res.FontBuilder") extern class FontBuilder {
	static function getFont(name:String, size:Int, ?options:hxd.res.FontBuilder.FontBuildOptions):h2d.Font;
	static function dispose():Void;
}
package h2d;

/**
 The `HtmlText` line height calculation rules.
 */
/**
	
		The `HtmlText` line height calculation rules.
	
**/
@:native("h2d.HtmlText") extern enum LineHeightMode {
	/**
		
				Accurate line height calculations. Each line will adjust it's height according to it's contents.
			
	**/
	Accurate;
	/**
		
				Only text adjusts line heights, and `<img>` tags do not affect it (partial legacy behavior).
			
	**/
	TextOnly;
	/**
		
				Legacy line height mode. When used, line heights remain constant based on `Text.font` variable.
			
	**/
	Constant;
}

/**
 `HtmlText` img tag vertical alignment rules.
 */
/**
	
		`HtmlText` img tag vertical alignment rules.
	
**/
@:native("h2d.HtmlText") extern enum ImageVerticalAlign {
	/**
		
				Align images along the top of the text line.
			
	**/
	Top;
	/**
		
				Align images to sit on the base line of the text.
			
	**/
	Bottom;
	/**
		
				Align images to the middle between the top of the text line its base line.
			
	**/
	Middle;
}

/**
 A simple HTML text renderer.
 
 See the [Text](https://github.com/HeapsIO/heaps/wiki/Text) section of the manual for more details and a list of the supported HTML tags.
 */
/**
	
		A simple HTML text renderer.
	
		See the [Text](https://github.com/HeapsIO/heaps/wiki/Text) section of the manual for more details and a list of the supported HTML tags.
	
**/
@:native("h2d.HtmlText") extern class HtmlText extends h2d.Text {
	function new(font:h2d.Font, ?parent:h2d.Object):Void;
	/**
		
				When enabled, condenses extra spaces (carriage-return, line-feed, tabulation and space character) to one space.
				If not set, uncondensed whitespace is left as is, as well as line-breaks.
			
	**/
	var condenseWhite(default, set) : Bool;
	/**
		
				When enabled, nodes that create interactives will propagate events
			
	**/
	var propagateInteractiveNode(default, set) : Bool;
	/**
		
				The spacing after `<img>` tags in pixels.
			
	**/
	var imageSpacing(default, set) : Float;
	/**
		
				Line height calculation mode controls how much space lines take up vertically.
				Changing mode to `Constant` restores the legacy behavior of HtmlText.
			
	**/
	var lineHeightMode(default, set) : h2d.HtmlText.LineHeightMode;
	/**
		
				Vertical alignment of the images in `<img>` tag relative to the text.
			
	**/
	var imageVerticalAlign(default, set) : h2d.HtmlText.ImageVerticalAlign;
	override function getShader<T:(hxsl.Shader)>(stype:Class<T>):T;
	/**
		
				Method that should return an `h2d.Tile` instance for `<img>` tags. By default calls `HtmlText.defaultLoadImage` method.
		
				HtmlText does not cache tile instances.
				Due to internal structure, method should be deterministic and always return same Tile on consequent calls with same `url` input.
				@param url A value contained in `src` attribute.
			
	**/
	function loadImage(url:String):h2d.Tile;
	/**
		
				Method that should return an `h2d.Font` instance for `<font>` tags with `face` attribute. By default calls `HtmlText.defaultLoadFont` method.
		
				HtmlText does not cache font instances and it's recommended to perform said caching from outside.
				Due to internal structure, method should be deterministic and always return same Font instance on consequent calls with same `name` input.
				@param name A value contained in `face` attribute.
				@returns Method should return loaded font instance or `null`. If `null` is returned - currently active font is used.
			
	**/
	function loadFont(name:String):h2d.Font;
	/**
		
				Called on a <a> tag click
			
	**/
	function onHyperlink(url:String):Void;
	/**
		
				Called on a <a> tag over
			
	**/
	function onOverHyperlink(url:String):Void;
	/**
		
				Called on a <a> tag out
			
	**/
	function onOutHyperlink(url:String):Void;
	/**
		
				Called when text is assigned, allowing to process arbitrary text to a valid XHTML.
			
	**/
	function formatText(text:String):String;
	/**
		
				Define a custom html tag to be displayed with specific font and color.
			
	**/
	function defineHtmlTag(name:String, ?fontColor:Int, ?fontName:String):Void;
	/**
		
				Define or reset a set of custom html tags to be displayed with specific font and color.
			
	**/
	function defineHtmlTags(tags:Array<{ public var name(default, default) : String; @:optional
	public var font(default, default) : String; @:optional
	public var color(default, default) : Int; }>):Void;
	override function splitText(text:String):String;
	override function getTextProgress(text:String, progress:Float):String;
	private function set_imageSpacing(s:Float):Float;
	private function set_condenseWhite(value:Bool):Bool;
	private function set_propagateInteractiveNode(value:Bool):Bool;
	private function set_imageVerticalAlign(align:h2d.HtmlText.ImageVerticalAlign):h2d.HtmlText.ImageVerticalAlign;
	private function set_lineHeightMode(v:h2d.HtmlText.LineHeightMode):h2d.HtmlText.LineHeightMode;
	/**
		
				A default method HtmlText uses to load images for `<img>` tag. See `HtmlText.loadImage` for details.
			
	**/
	static function defaultLoadImage(url:String):h2d.Tile;
	/**
		
				A default method HtmlText uses to load fonts for `<font>` tags with `face` attribute. See `HtmlText.loadFont` for details.
			
	**/
	static function defaultLoadFont(name:String):h2d.Font;
	/**
		
				A default method HtmlText uses to format assigned text. See `HtmlText.formatText` for details.
			
	**/
	static function defaultFormatText(text:String):String;
	/**
		
				Associate a custom html tag to a specific font and color.
			
	**/
	static function defineDefaultHtmlTag(name:String, ?fontColor:Int, ?fontName:String):Void;
}
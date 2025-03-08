package h2d;

/**
 A basic text renderer with multiline support.
 
 See [Text](https://github.com/HeapsIO/heaps/wiki/Text) section of the manual for more details.
 */
/**
	
		A basic text renderer with multiline support.
	
		See [Text](https://github.com/HeapsIO/heaps/wiki/Text) section of the manual for more details.
	
**/
@:native("h2d.Text") extern class Text extends h2d.Drawable {
	/**
		
				Creates a new Text instance.
				@param font The font used to render the Text.
				@param parent An optional parent `h2d.Object` instance to which Text adds itself if set.
			
	**/
	function new(font:h2d.Font, ?parent:h2d.Object):Void;
	/**
		
				The font used to render text.
			
	**/
	var font(default, set) : h2d.Font;
	/**
		
				Current rendered text.
			
	**/
	var text(default, set) : String;
	/**
		
				Text RGB color. Alpha value is ignored.
			
	**/
	var textColor(default, set) : Int;
	/**
		
				When set, limits maximum line width and causes word-wrap.
				Affects positioning of the text depending on `textAlign` value.
		
				When Text is affected by size constraints (see `Object.constraintSize`), smallest of the two is used for word-wrap.
			
	**/
	var maxWidth(default, set) : Float;
	/**
		
				Adds simple drop shadow to the Text with specified offset, color and alpha.
				Causes text to be rendered twice (first drop shadow and then the text itself).
			
	**/
	var dropShadow : { var alpha : Float; var color : Int; var dx : Float; var dy : Float; };
	/**
		
				Calculated text width. Can exceed maxWidth in certain cases.
			
	**/
	var textWidth(get, null) : Float;
	/**
		
				Calculated text height.
		
				Not a completely precise text metric and increments in the `Font.lineHeight` steps.
				In `HtmlText`, can be increased by various values depending on the active line font and `HtmlText.lineHeightMode` value.
			
	**/
	var textHeight(get, null) : Float;
	/**
		
				Text align rules dictate how the text lines are positioned.
				See `Align` for specific details on each alignment mode.
			
	**/
	var textAlign(default, set) : h2d.Text.Align;
	/**
		
				Extra letter spacing in pixels.
			
	**/
	var letterSpacing(default, set) : Float;
	/**
		
				Extra line spacing in pixels.
			
	**/
	var lineSpacing(default, set) : Float;
	/**
		
				Allow line break.
			
	**/
	var lineBreak(default, set) : Bool;
	private function set_font(font:h2d.Font):h2d.Font;
	private function set_textAlign(a:h2d.Text.Align):h2d.Text.Align;
	private function set_letterSpacing(s:Float):Float;
	private function set_lineSpacing(s:Float):Float;
	private function set_lineBreak(b:Bool):Bool;
	private function set_text(t:String):String;
	/**
		
				Calculates and returns width of the provided `text` with settings this Text instance.
			
	**/
	function calcTextWidth(text:String):Float;
	/**
		
				Perform a word-wrap of the `text` based on this Text settings.
			
	**/
	function splitText(text:String):String;
	/**
		
				Returns cut `text` based on `progress` percentile.
				Can be used to gradually show appearing text. (Especially useful when using `HtmlText`)
			
	**/
	function getTextProgress(text:String, progress:Float):String;
	private function get_textHeight():Float;
	private function get_textWidth():Float;
	private function set_maxWidth(w:Float):Float;
	private function set_textColor(c:Int):Int;
}

/**
 `Text` alignment rules.
 */
/**
	
		`Text` alignment rules.
	
**/
@:native("h2d.Text") extern enum Align {
	/**
		
				Aligns the text to the left edge.
			
	**/
	Left;
	/**
		
				Aligns the text to the right edge.
		
				When `Text.maxWidth` is set and/or Text size is constrained (see `Object.constraintSize`), right edge is considered the smallest of the two.
		
				Otherwise edge is at the `0` coordinate of the Text instance.
		
				See Text sample for showcase.
			
	**/
	Right;
	/**
		
				Centers the text alignment.
		
				When `Text.maxWidth` is set and/or Text size is constrained (see `Object.constraintSize`), center is calculated from 0 to the smallest of the two.
		
				Otherwise text is centered around `0` coordinate of the Text instance.
		
				See Text sample for showcase.
			
	**/
	Center;
	/**
		
				With respect to Text constraints, aligns the text to the right edge of the longest line width.
		
				When `Text.maxWidth` is set and/or Text size is constrained (see `Object.constraintSize`),
				right edge is calculated as the smallest value of the `maxWidth`, constrained width and longest line width (after word-wrap from constraints).
		
				Otherwise uses longest line width as the right edge.
		
				See Text sample for showcase.
			
	**/
	MultilineRight;
	/**
		
				Centers the text with respect to Text constraints with the longest line width.
		
				When `Text.maxWidth` is set and/or Text size is constrained (see `Object.constraintSize`),
				center is calculated from the to the smallest value of the `maxWidth`, constrained width and longest line width (after word-wrap from constraints).
		
				Otherwise calculates center from 0 to the longest line width.
		
				See Text sample for showcase.
			
	**/
	MultilineCenter;
}
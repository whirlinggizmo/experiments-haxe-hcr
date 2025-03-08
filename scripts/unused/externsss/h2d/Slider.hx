package h2d;

/**
 A simple interactive horizontal numerical slider.
 */
/**
	
		A simple interactive horizontal numerical slider.
	
**/
@:native("h2d.Slider") extern class Slider extends h2d.Interactive {
	/**
		
				Create a new Slider width specified dimensions and parent.
				@param width The width of the Slider interactive area.
				@param height The height of the Slider interactive area.
				@param parent An optional parent `h2d.Object` instance to which Sliders adds itself if set.
			
	**/
	function new(?width:Int, ?height:Int, ?parent:h2d.Object):Void;
	/**
		
				The slider background tile.
		
				If Tile width does not match with Slider width, it will be resized through `Tile.setSize` to match the Slider width.
		
				Defaults to the monocolor 0x808080 Tile with the size of `Slider.width x 4` and centered vertically within `Slider.height`.
			
	**/
	var tile : h2d.Tile;
	/**
		
				Tile of the slider current position caret.
		
				Defaults to the monocolor #CCCCCC Tile with the size of `5 x Slider.height`.
			
	**/
	var cursorTile : h2d.Tile;
	/**
		
				The minimum value the Slider can allow.
			
	**/
	var minValue(default, set) : Float;
	/**
		
				The maximum value the Slider can allow.
			
	**/
	var maxValue(default, set) : Float;
	/**
		
				Current value of the Slider.
				When set, will be clamped to `minValue <= value <= maxValue`.
			
	**/
	var value(default, set) : Float;
	private function set_minValue(v:Float):Float;
	private function set_maxValue(v:Float):Float;
	private function set_value(v:Float):Float;
	override function handleEvent(e:hxd.Event):Void;
	/**
		
				Sent when slider value is changed by user.
		
				Not sent if value is set manually from software side.
			
	**/
	function onChange():Void;
}
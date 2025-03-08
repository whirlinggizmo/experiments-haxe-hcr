package h2d;

/**
 A simple 9-slice bitmap renderer.
 
 Enables rendering of the Tile as a stretchable surface with unscaled corners, stretched center and either stretched or tiled borders.
 Set `ScaleGrid.width` and `ScaleGrid.height` to resize the ScaleGrid.
 */
/**
	
		A simple 9-slice bitmap renderer.
	
		Enables rendering of the Tile as a stretchable surface with unscaled corners, stretched center and either stretched or tiled borders.
		Set `ScaleGrid.width` and `ScaleGrid.height` to resize the ScaleGrid.
	
**/
@:native("h2d.ScaleGrid") extern class ScaleGrid extends h2d.TileGroup {
	/**
		
				Create a new ScaleGrid with specified parameters.
				@param tile The source tile which will be sliced.
				@param borderW The width of the left and right borders in pixels.
				@param borderH The height of the top and bottom borders in pixels.
				@param parent An optional parent `h2d.Object` instance to which ScaleGrid adds itself if set.
			
	**/
	function new(tile:h2d.Tile, borderL:Int, borderT:Int, ?borderR:Int, ?borderB:Int, ?parent:h2d.Object):Void;
	/**
		
				The width of the left border in pixels.
			
	**/
	var borderLeft(default, set) : Int;
	/**
		
				The width of the right border in pixels.
			
	**/
	var borderRight(default, set) : Int;
	/**
		
				The height of the top border in pixels.
			
	**/
	var borderTop(default, set) : Int;
	/**
		
				The height of the bottom border in pixels.
			
	**/
	var borderBottom(default, set) : Int;
	/**
		
				Set the width of left and right borders altogether.
			
	**/
	var borderWidth(never, set) : Int;
	/**
		
				Set the height of top and bottom borders altogether.
			
	**/
	var borderHeight(never, set) : Int;
	/**
		
				The width of the bitmap. Setting to values less than `borderLeft + borderRight` leads to undefined results.
			
	**/
	var width(default, set) : Float;
	/**
		
				The height of the bitmap. Setting to values less than `borderTop + borderBottom` leads to undefined results.
			
	**/
	var height(default, set) : Float;
	/**
		
				When enabled, borders will be repeated along the edges instead of stretching to match the desired dimensions.
			
	**/
	var tileBorders(default, set) : Bool;
	/**
		
				When enabled, center will be repeated along the edges instead of stretching to match the desired dimensions.
			
	**/
	var tileCenter(default, set) : Bool;
	/**
		
				When enabled, the borders will ignore the final scale of the `h2d.ScaleGrid` to be rendered pixel perfect.
				This does not change the values of `borderLeft`, `borderRight`, `borderTop` or `borderBottom`.
		
				Center tile is always stretched.
			
	**/
	var ignoreScale(default, set) : Bool;
	/**
		
				Scale factor applied to borders only. If combined with `ignoreScale`, becomes an absolute scale independent from the scene scale.
			
	**/
	var borderScale(default, set) : Float;
	private function set_tileBorders(b:Bool):Bool;
	private function set_tileCenter(b:Bool):Bool;
	private function set_ignoreScale(b:Bool):Bool;
	private function set_borderScale(s:Float):Float;
	private function set_width(w:Float):Float;
	private function set_height(h:Float):Float;
	private function set_borderWidth(w:Int):Int;
	private function set_borderHeight(h:Int):Int;
	private function set_borderTop(top:Int):Int;
	private function set_borderBottom(bot:Int):Int;
	private function set_borderLeft(left:Int):Int;
	private function set_borderRight(right:Int):Int;
}
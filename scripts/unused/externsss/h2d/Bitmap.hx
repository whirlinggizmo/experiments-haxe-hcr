package h2d;

/**
 Displays a single bitmap Tile on the screen.
 
 It is a most primitive Drawable and easiest to use, but vastly inferior to others in terms of performance when used for rendering of many tiles.
 When dealing with many images at once, it is recommended to use batched renderers, like `h2d.SpriteBatch` or `h2d.TileGroup`.
 */
/**
	
		Displays a single bitmap Tile on the screen.
	
		It is a most primitive Drawable and easiest to use, but vastly inferior to others in terms of performance when used for rendering of many tiles.
		When dealing with many images at once, it is recommended to use batched renderers, like `h2d.SpriteBatch` or `h2d.TileGroup`.
	
**/
@:native("h2d.Bitmap") extern class Bitmap extends h2d.Drawable {
	/**
		
				Create a Bitmap with specified tile and parent object.
				@param tile A Tile that should be rendered by this Bitmap.
				@param parent An optional parent `h2d.Object` instance to which Bitmap adds itself if set.
			
	**/
	function new(?tile:h2d.Tile, ?parent:h2d.Object):Void;
	/**
		
				The tile to display. See `h2d.Tile` documentation for details.
				If the tile is null, a pink 5x5 bitmap will be displayed instead.
			
	**/
	var tile(default, set) : h2d.Tile;
	/**
		
				If set, rescale the tile to match the given width, keeping the aspect ratio unless `height` is also set.
		
				Note that both `width` and `height` are `null` by default and in order to retrieve bitmap dimensions with
				scaling accurately, call `getSize` method or address `tile.width/height` to get unscaled dimensions.
			
	**/
	var width(default, set) : Float;
	/**
		
				If set, rescale the tile to match the given height, keeping the aspect ratio unless `width` is also set.
		
				Note that both `width` and `height` are `null` by default and in order to retrieve bitmap dimensions with
				scaling accurately, call `getSize` method or address `tile.width/height` to get unscaled dimensions.
			
	**/
	var height(default, set) : Float;
	private function set_width(w:Float):Float;
	private function set_height(h:Float):Float;
	private function set_tile(t:h2d.Tile):h2d.Tile;
}
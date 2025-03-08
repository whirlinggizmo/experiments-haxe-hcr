package h2d.filter;

/**
 Performs an arbitrary shape masking of the filtered Object.
 
 @see `AbstractMask`
 */
/**
	
		Performs an arbitrary shape masking of the filtered Object.
	
		@see `AbstractMask`
	
**/
@:native("h2d.filter.Mask") extern class Mask extends h2d.filter.AbstractMask {
	/**
		
				Create new Mask filter.
				@param mask An `Object` that will be used for masking. See `AbstractMask.mask` for limitations.
				@param maskVisible When enabled, masking `Object` will be visible. Hidden otherwise.
				@param smoothAlpha Enables masking Object alpha merging. Otherwise causes unsmoothed masking of non-zero alpha areas.
			
	**/
	function new(mask:h2d.Object, ?maskVisible:Bool, ?smoothAlpha:Bool):Void;
	/**
		
				Enables masking Object alpha merging. Otherwise causes unsmoothed masking of non-zero alpha areas.
			
	**/
	var smoothAlpha(get, set) : Bool;
	private function get_smoothAlpha():Bool;
	private function set_smoothAlpha(v:Bool):Bool;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
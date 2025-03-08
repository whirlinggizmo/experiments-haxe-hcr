package h2d.filter;

/**
 A ColorMatrix filer that applies color correction depending on the masked area.
 
 Uses masked objects `red*alpha` channels to determine the transition from original color and transformed color.
 
 _Hacking_: Through accessing color matrix shader directly via `@:privateAccess ambient.pass.shader.maskChannel`
 it's possible to modify which channels affect the resulting transition value.
 
 @see `ColorMatrix`
 */
/**
	
		A ColorMatrix filer that applies color correction depending on the masked area.
	
		Uses masked objects `red*alpha` channels to determine the transition from original color and transformed color.
	
		_Hacking_: Through accessing color matrix shader directly via `@:privateAccess ambient.pass.shader.maskChannel`
		it's possible to modify which channels affect the resulting transition value.
	
		@see `ColorMatrix`
	
**/
@:native("h2d.filter.Ambient") extern class Ambient extends h2d.filter.AbstractMask {
	/**
		
				Create new Ambient filter.
				@param mask An `Object` that will be used for masking. See `AbstractMask.mask` for limitations.
				@param m The color matrix that is applied to the area dictated by `Ambient.invert`.
			
	**/
	function new(mask:h2d.Object, ?m:h3d.Matrix):Void;
	/**
		
				The exponent of the mask color values that affects transition speed.
			
	**/
	var power(get, set) : Float;
	/**
		
				Whether to apply ambient color correction inside masked (when enabled) area or outside of it (when disabled).
			
	**/
	var invert(get, set) : Bool;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
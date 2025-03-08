package h2d.filter;

/**
 Applies a normal map to the filtered Object in order to displace pixels.
 
 Uses red and green channels to displaces horizontal and vertical axes accordingly.
 */
/**
	
		Applies a normal map to the filtered Object in order to displace pixels.
	
		Uses red and green channels to displaces horizontal and vertical axes accordingly.
	
**/
@:native("h2d.filter.Displacement") extern class Displacement extends h2d.filter.Filter {
	/**
		
				Create a new displacement filter.
				@param normalMap The normal map used for displacement lookup.
				@param dispX Horizontal displacement distance in pixels.
				@param dispY Vertical displacement distance in pixels.
				@param wrap Wrap normal map around when lookup UV goes out of bounds.
			
	**/
	function new(normalMap:h2d.Tile, ?dispX:Float, ?dispY:Float, ?wrap:Bool):Void;
	/**
		
				The normal map used for displacement lookup.
			
	**/
	var normalMap : h2d.Tile;
	/**
		
				Horizontal displacement distance in pixels.
			
	**/
	var dispX : Float;
	/**
		
				Vertical displacement distance in pixels.
			
	**/
	var dispY : Float;
	/**
		
				When enabled, the displacement map will wrap around when lookup reaches its edges.
				Otherwise out-of-bounds values are clamped to the border.
			
	**/
	var wrap(default, set) : Bool;
	private function set_wrap(w:Bool):Bool;
	override function sync(ctx:h2d.RenderContext, s:h2d.Object):Void;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
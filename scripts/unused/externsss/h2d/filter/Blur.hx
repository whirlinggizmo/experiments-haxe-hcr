package h2d.filter;

/**
 Utilizes the `h3d.pass.Blur` render pass to perform a blurring operation on the filtered object.
 */
/**
	
		Utilizes the `h3d.pass.Blur` render pass to perform a blurring operation on the filtered object.
	
**/
@:native("h2d.filter.Blur") extern class Blur extends h2d.filter.Filter {
	/**
		
				Create a new Blur filter.
				@param radius The blur distance in pixels.
				@param gain The color gain when blurring.
				@param quality The sample count on each pixel as a tradeoff of speed/quality.
				@param linear Linear blur power. Set to 0 for gaussian blur.
			
	**/
	function new(?radius:Float, ?gain:Float, ?quality:Float, ?linear:Float):Void;
	/**
		
				@see `h3d.pass.Blur.radius`
			
	**/
	var radius(get, set) : Float;
	/**
		
				@see `h3d.pass.Blur.linear`
			
	**/
	var linear(get, set) : Float;
	/**
		
				@see `h3d.pass.Blur.gain`
			
	**/
	var gain(get, set) : Float;
	/**
		
				@see `h3d.pass.Blur.quality`
			
	**/
	var quality(get, set) : Float;
	override function sync(ctx:h2d.RenderContext, s:h2d.Object):Void;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
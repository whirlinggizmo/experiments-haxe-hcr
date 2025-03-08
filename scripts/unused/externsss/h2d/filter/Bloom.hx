package h2d.filter;

/**
 Applies a bloom effect to the filtered Object.
 Produces feathers to light areas in the objects.
 */
/**
	
		Applies a bloom effect to the filtered Object.
		Produces feathers to light areas in the objects.
	
**/
@:native("h2d.filter.Bloom") extern class Bloom extends h2d.filter.Blur {
	/**
		
				@param power The bloom luminosity exponent.
				@param amount The bloom luminosity multiplier.
				@param radius The bloom glow distance in pixels.
				@param gain The bloom color intensity.
				@param quality The sample count on each pixel as a tradeoff of speed/quality.
			
	**/
	function new(?power:Float, ?amount:Float, ?radius:Float, ?gain:Float, ?quality:Float):Void;
	/**
		
				The bloom luminosity multiplier.
			
	**/
	var amount(get, set) : Float;
	/**
		
				The bloom luminosity exponent.
			
	**/
	var power(get, set) : Float;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
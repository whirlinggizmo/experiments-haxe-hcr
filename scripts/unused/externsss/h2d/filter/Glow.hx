package h2d.filter;

/**
 Adds a glow backdrop to the filtered Object.
 */
/**
	
		Adds a glow backdrop to the filtered Object.
	
**/
@:native("h2d.filter.Glow") extern class Glow extends h2d.filter.Blur {
	/**
		
				Create new Glow filter.
				@param color The color of the glow.
				@param alpha Transparency value of the glow.
				@param radius The glow distance in pixels.
				@param gain The glow color intensity.
				@param quality The sample count on each pixel as a tradeoff of speed/quality.
				@param smoothColor Produce gradient glow when enabled, otherwise creates hard glow without smoothing.
			
	**/
	function new(?color:Int, ?alpha:Float, ?radius:Float, ?gain:Float, ?quality:Float, ?smoothColor:Bool):Void;
	/**
		
				The color of the glow.
			
	**/
	var color : Int;
	/**
		
				Transparency value of the glow.
			
	**/
	var alpha : Float;
	/**
		
				Subtracts the original image from the glow output when enabled.
			
	**/
	var knockout : Bool;
	/**
		
				Produce gradient glow when enabled, otherwise creates hard glow without smoothing.
			
	**/
	var smoothColor : Bool;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
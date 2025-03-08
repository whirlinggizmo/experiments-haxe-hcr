package h2d.filter;

/**
 Adds a soft shadow to the filtered Object.
 */
/**
	
		Adds a soft shadow to the filtered Object.
	
**/
@:native("h2d.filter.DropShadow") extern class DropShadow extends h2d.filter.Glow {
	/**
		
				Create a new Shadow filter.
				@param distance The offset of the shadow in the `angle` direction.
				@param angle Shadow offset direction angle.
				@param color The color of the shadow.
				@param alpha Transparency value of the shadow.
				@param radius The shadow glow distance in pixels.
				@param gain The shadow color intensity.
				@param quality The sample count on each pixel as a tradeoff of speed/quality.
				@param smoothColor Produce gradient shadow when enabled, otherwise creates hard shadow without smoothing.
			
	**/
	function new(?distance:Float, ?angle:Float, ?color:Int, ?alpha:Float, ?radius:Float, ?gain:Float, ?quality:Float, ?smoothColor:Bool):Void;
	/**
		
				The offset distance of the shadow in the direction of `DropShadow.angle`.
			
	**/
	var distance : Float;
	/**
		
				The shadow offset direction angle.
			
	**/
	var angle : Float;
	override function sync(ctx:h2d.RenderContext, s:h2d.Object):Void;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
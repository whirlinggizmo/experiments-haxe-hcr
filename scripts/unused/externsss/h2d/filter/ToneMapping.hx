package h2d.filter;

/**
 Applies a color correction that emulates tonemapping.
 */
/**
	
		Applies a color correction that emulates tonemapping.
	
**/
@:native("h2d.filter.ToneMapping") extern class ToneMapping extends h2d.filter.Filter {
	/**
		
				Create a new ColorMatrix filter.
		
				@param gamma The value used to modify the resulting colors.
			
	**/
	function new(?g:Float):Void;
	/**
		
				The value used to apply gamma correction.
			
	**/
	var gamma(get, set) : Float;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
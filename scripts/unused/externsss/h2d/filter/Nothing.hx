package h2d.filter;

/**
 A filter that renders nothing.
 */
/**
	
		A filter that renders nothing.
	
**/
@:native("h2d.filter.Nothing") extern class Nothing extends h2d.filter.Filter {
	/**
		
				Create a new Nothing filter.
			
	**/
	function new():Void;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
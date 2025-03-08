package h2d.filter;

/**
 Provides a solid color outline to the filtered object by utilizing `h3d.pass.Outline` render pass.
 */
/**
	
		Provides a solid color outline to the filtered object by utilizing `h3d.pass.Outline` render pass.
	
**/
@:native("h2d.filter.Outline") extern class Outline extends h2d.filter.Filter {
	/**
		
				Create a new Outline filter.
				@param size Width of the outline.
				@param color The color of the outline.
				@param quality The sample count with quality/speed tradeoff.
				@param multiplyAlpha Enable alpha premultiplying of the resulting color.
			
	**/
	function new(?size:Float, ?color:Int, ?quality:Float, ?multiplyAlpha:Bool):Void;
	/**
		
				The width of the outline.
				@see `h3d.pass.Outline.size`
			
	**/
	var size(get, set) : Float;
	/**
		
				The color of the outline.
				@see `h3d.pass.Outline.color`
			
	**/
	var color(get, set) : Int;
	/**
		
				Represents sample count with quality/speed tradeoff.
				Larger value leads to more samples and more accurate outline in exchange to calculation speed.
				@see `h3d.pass.Outline.quality`
			
	**/
	var quality(get, set) : Float;
	/**
		
				Premultiplies the resulting color with its alpha when enabled.
				@see `h2d.pass.Outline.multiplyAlpha`
			
	**/
	var multiplyAlpha(get, set) : Bool;
	/**
		
				The transparency of the outline.
			
	**/
	var alpha(get, set) : Float;
	override function sync(ctx:h2d.RenderContext, s:h2d.Object):Void;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
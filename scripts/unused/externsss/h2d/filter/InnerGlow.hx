package h2d.filter;

/**
 Adds a glow backdrop to the filtered Object.
 */
/**
	
		Adds a glow backdrop to the filtered Object.
	
**/
@:native("h2d.filter.InnerGlow") extern class InnerGlow extends h2d.filter.Blur {
	function new(?color:Int, ?alpha:Float, ?radius:Float, ?gain:Float, ?quality:Float):Void;
	var color : Int;
	var alpha : Float;
	var blendMode : h2d.BlendMode;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
}
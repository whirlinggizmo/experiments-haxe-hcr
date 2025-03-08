package h2d;

@:dox(hide) @:native("h2d.Graphics") extern class GPoint {
	function new():Void;
	var x : Float;
	var y : Float;
	var r : Float;
	var g : Float;
	var b : Float;
	var a : Float;
	function load(x:Float, y:Float, r:Float, g:Float, b:Float, a:Float):Void;
}

/**
 A simple interface to draw arbitrary 2D geometry.
 
 Usage notes:
 * While Graphics allows for multiple unique textures, each texture swap causes a new drawcall,
 and due to that it's recommended to minimize the amount of used textures per Graphics instance,
 ideally limiting to only one texture.
 * Due to how Graphics operate, removing them from the active `h2d.Scene` will cause a loss of all data.
 */
/**
	
		A simple interface to draw arbitrary 2D geometry.
	
		Usage notes:
		* While Graphics allows for multiple unique textures, each texture swap causes a new drawcall,
		and due to that it's recommended to minimize the amount of used textures per Graphics instance,
		ideally limiting to only one texture.
		* Due to how Graphics operate, removing them from the active `h2d.Scene` will cause a loss of all data.
	
**/
@:native("h2d.Graphics") extern class Graphics extends h2d.Drawable {
	/**
		
				Create a new Graphics instance.
				@param parent An optional parent `h2d.Object` instance to which Graphics adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				The Tile used as source of Texture to render.
			
	**/
	var tile : h2d.Tile;
	/**
		
				Adds bevel cut-off at line corners.
		
				The value is a percentile in range of 0...1, dictating at which point edges get beveled based on their angle.
				Value of 0 being not beveled and 1 being always beveled.
			
	**/
	var bevel : Float;
	/**
		
				Clears the Graphics contents.
			
	**/
	function clear():Void;
	/**
		
				Begins a solid color fill.
		
				Beginning new fill will finish previous fill operation without need to call `Graphics.endFill`.
		
				@param color An RGB color with which to fill the drawn shapes.
				@param alpha A transparency of the fill color.
			
	**/
	function beginFill(?color:Int, ?alpha:Float):Void;
	/**
		
				Position a virtual tile at the given position and scale. Every draw will display a part of this tile relative
				to these coordinates.
		
				Note that in by default, Tile is not wrapped, and in order to render a tiling texture, `Drawable.tileWrap` has to be set.
				Additionally, both `Tile.dx` and `Tile.dy` are ignored (use `dx`/`dy` arguments instead)
				as well as tile defined size of the tile through `Tile.width` and `Tile.height` (use `scaleX`/`scaleY` relative to texture size).
		
				Beginning new fill will finish previous fill operation without need to call `Graphics.endFill`.
		
				@param dx An X offset of the Tile relative to Graphics.
				@param dy An Y offset of the Tile relative to Graphics.
				@param scaleX A horizontal scale factor applied to the Tile texture.
				@param scaleY A vertical scale factor applied to the Tile texture.
				@param tile The tile to fill with. If null, uses previously used Tile with `beginTileFill` or throws an error.
				Previous tile is remembered across `Graphics.clear` calls.
			
	**/
	function beginTileFill(?dx:Float, ?dy:Float, ?scaleX:Float, ?scaleY:Float, ?tile:h2d.Tile):Void;
	/**
		
				Draws a Tile at given position.
				See `Graphics.beginTileFill` for limitations.
		
				This methods ends current fill operation.
				@param x The X position of the tile.
				@param y The Y position of the tile.
				@param tile The tile to draw.
			
	**/
	function drawTile(x:Float, y:Float, tile:h2d.Tile):Void;
	/**
		
				Sets an outline style. Changing the line style ends the currently drawn line.
		
				@param size Width of the outline. Setting size to 0 will remove the outline.
				@param color An outline RGB color.
				@param alpha An outline transparency.
			
	**/
	function lineStyle(?size:Float, ?color:Int, ?alpha:Float):Void;
	/**
		
				Ends the current fill operation.
			
	**/
	function endFill():Void;
	/**
		
				Draws a rectangle with given parameters.
				@param x The rectangle top-left corner X position.
				@param y The rectangle top-left corner Y position.
				@param w The rectangle width.
				@param h The rectangle height.
			
	**/
	function drawRect(x:Float, y:Float, w:Float, h:Float):Void;
	/**
		
				Draws a rounded rectangle with given parameters.
				@param x The rectangle top-left corner X position.
				@param y The rectangle top-left corner Y position.
				@param w The rectangle width.
				@param h The rectangle height.
				@param radius Radius of the rectangle corners.
				@param nsegments Amount of segments used for corners. When `0` segment count calculated automatically.
			
	**/
	function drawRoundedRect(x:Float, y:Float, w:Float, h:Float, radius:Float, ?nsegments:Int):Void;
	/**
		
				Draws a circle centered at given position.
				@param cx X center position of the circle.
				@param cy Y center position of the circle.
				@param radius Radius of the circle.
				@param nsegments Amount of segments used to draw the circle. When `0`, amount of segments calculated automatically.
			
	**/
	function drawCircle(cx:Float, cy:Float, radius:Float, ?nsegments:Int):Void;
	/**
		
				Draws an ellipse centered at given position.
				@param cx X center position of the ellipse.
				@param cy Y center position of the ellipse.
				@param radiusX Horizontal radius of an ellipse.
				@param radiusY Vertical radius of an ellipse.
				@param rotationAngle Ellipse rotation in radians.
				@param nsegments Amount of segments used to draw an ellipse. When `0`, amount of segments calculated automatically.
			
	**/
	function drawEllipse(cx:Float, cy:Float, radiusX:Float, radiusY:Float, ?rotationAngle:Float, ?nsegments:Int):Void;
	/**
		
				Draws a pie centered at given position.
				@param cx X center position of the pie.
				@param cy Y center position of the pie.
				@param radius Radius of the pie.
				@param angleStart Starting angle of the pie in radians.
				@param angleLength The pie size in clockwise direction with `2*PI` being full circle.
				@param nsegments Amount of segments used to draw the pie. When `0`, amount of segments calculated automatically.
			
	**/
	function drawPie(cx:Float, cy:Float, radius:Float, angleStart:Float, angleLength:Float, ?nsegments:Int):Void;
	/**
		
				Draws a double-edged pie centered at given position.
				@param cx X center position of the pie.
				@param cy Y center position of the pie.
				@param radius The outer radius of the pie.
				@param innerRadius The inner radius of the pie.
				@param angleStart Starting angle of the pie in radians.
				@param angleLength The pie size in clockwise direction with `2*PI` being full circle.
				@param nsegments Amount of segments used to draw the pie. When `0`, amount of segments calculated automatically.
			
	**/
	function drawPieInner(cx:Float, cy:Float, radius:Float, innerRadius:Float, angleStart:Float, angleLength:Float, ?nsegments:Int):Void;
	/**
		
				Draws a rectangular pie centered at given position.
				@param cx X center position of the pie.
				@param cy Y center position of the pie.
				@param width Width of the pie.
				@param height Height of the pie.
				@param angleStart Starting angle of the pie in radians.
				@param angleLength The pie size in clockwise direction with `2*PI` being solid rectangle.
				@param nsegments Amount of segments used to draw the pie. When `0`, amount of segments calculated automatically.
			
	**/
	function drawRectanglePie(cx:Float, cy:Float, width:Float, height:Float, angleStart:Float, angleLength:Float, ?nsegments:Int):Void;
	/**
		
			 * Draws a quadratic Bezier curve using the current line style from the current drawing position to (cx, cy) and using the control point that (bx, by) specifies.
			 * IvanK Lib port ( http://lib.ivank.net )
			 
	**/
	function curveTo(bx:Float, by:Float, cx:Float, cy:Float):Void;
	/**
		
			 * Draws a cubic Bezier curve from the current drawing position to the specified anchor point.
			 * IvanK Lib port ( http://lib.ivank.net )
			 * @param bx control X for start point
			 * @param by control Y for start point
			 * @param cx control X for end point
			 * @param cy control Y for end point
			 * @param dx end X
			 * @param dy end Y
			 * @param nsegments = 40
			 
	**/
	function cubicCurveTo(bx:Float, by:Float, cx:Float, cy:Float, dx:Float, dy:Float, ?nsegments:Int):Void;
	/**
		
				Advanced usage. Adds new vertex to the current polygon with given parameters and current line style.
				@param x Vertex X position
				@param y Vertex Y position
				@param r Red tint value of the vertex when performing fill operation.
				@param g Green tint value of the vertex when performing fill operation.
				@param b Blue tint value of the vertex when performing fill operation.
				@param a Alpha of the vertex when performing fill operation.
				@param u Normalized horizontal Texture position from the current Tile fill operation.
				@param v Normalized vertical Texture position from the current Tile fill operation.
			
	**/
	function addVertex(x:Float, y:Float, r:Float, g:Float, b:Float, a:Float, ?u:Float, ?v:Float):Void;
}
package h2d;

/**
 A static Tile batch renderer.
 
 TileGroup follows an upload-once policy and does not allow modification of the already added geometry.
 To add new geometry it's mandatory to call `TileGroup.invalidate`. In case existing geometry has to be modified -
 entire group have to be cleared with `TileGroup.clear` and repopulated from ground up.
 
 Usage note: While TileGroup allows for multiple unique textures, each texture swap causes a new drawcall,
 and due to that it's recommended to minimize the amount of used textures per TileGroup instance,
 ideally limiting to only one texture.
 */
/**
	
		A static Tile batch renderer.
	
		TileGroup follows an upload-once policy and does not allow modification of the already added geometry.
		To add new geometry it's mandatory to call `TileGroup.invalidate`. In case existing geometry has to be modified -
		entire group have to be cleared with `TileGroup.clear` and repopulated from ground up.
	
		Usage note: While TileGroup allows for multiple unique textures, each texture swap causes a new drawcall,
		and due to that it's recommended to minimize the amount of used textures per TileGroup instance,
		ideally limiting to only one texture.
	
**/
@:native("h2d.TileGroup") extern class TileGroup extends h2d.Drawable {
	/**
		
				Create new TileGroup instance using Texture based on provided Tile.
				@param t The Tile which is used as a source for a Texture to be rendered.
				@param parent An optional parent `h2d.Object` instance to which TileGroup adds itself if set.
			
	**/
	function new(?t:h2d.Tile, ?parent:h2d.Object):Void;
	/**
		
				The reference tile used as a Texture source to draw.
			
	**/
	var tile : h2d.Tile;
	/**
		
				If set, only tiles indexed above or equal to `rangeMin` will be drawn.
			
	**/
	var rangeMin : Int;
	/**
		
				If set, only tiles indexed below `rangeMax` will be drawn.
			
	**/
	var rangeMax : Int;
	/**
		
				Clears all TileGroup contents and disposes allocated GPU memory.
			
	**/
	function clear():Void;
	/**
		
				When new data is added, it's not automatically flushed to the GPU memory if it was already allocated
				(when TileGroup is either rendered or received `Object.sync` call),
				in which case call `invalidate()` to force a refresh of the GPU data.
			
	**/
	function invalidate():Void;
	/**
		
				Returns the number of tiles added to the group.
			
	**/
	function count():Int;
	/**
		
				Sets the default tinting color when adding new Tiles.
			
	**/
	function setDefaultColor(rgb:Int, ?alpha:Float):Void;
}

/**
 TileGroup internal class for batched quad geometry rendering.
 */
/**
	
		TileGroup internal class for batched quad geometry rendering.
	
**/
@:dox(hide) @:native("h2d.TileGroup") extern class TileLayerContent extends h3d.prim.Primitive {
	function new():Void;
	/**
		
				Content bounds left edge.
			
	**/
	var xMin : Float;
	/**
		
				Content bounds top edge.
			
	**/
	var yMin : Float;
	/**
		
				Content bounds right edge.
			
	**/
	var xMax : Float;
	/**
		
				Content bounds bottom edge.
			
	**/
	var yMax : Float;
	var useAllocatorLimit : Int;
	/**
		
				Remove all data from Content instance.
			
	**/
	function clear():Void;
	function isEmpty():Bool;
	override function triCount():Int;
	/**
		
				Adds tinted Tile at specified position.
				@param x X position of the tile relative to drawn Object.
				@param y Y position of the tile relative to drawn Object.
				@param r Red tint value (0...1 range)
				@param g Green tint value (0...1 range)
				@param b Blue tint value (0...1 range)
				@param a Alpha of the drawn Tile
				@param t The Tile to draw.
			
	**/
	function add(x:Float, y:Float, r:Float, g:Float, b:Float, a:Float, t:h2d.Tile):Void;
	/**
		
				Adds tinted Tile at specified position with provided transform.
				@param x X position of the tile relative to drawn Object.
				@param y Y position of the tile relative to drawn Object.
				@param sx X-axis scaling factor of the Tile.
				@param sy Y-axis scaling factor of the Tile.
				@param r Rotation (in radians) of the Tile.
				@param c An RGBA vector used for tinting.
				@param t The Tile to draw.
			
	**/
	function addTransform(x:Float, y:Float, sx:Float, sy:Float, r:Float, c:h3d.Vector4, t:h2d.Tile):Void;
	/**
		
				Intended for internal usage. Adds single vertex to the buffer with no 0 uv.
		
				Usage warning: When adding geometry trough addPoint, they should be added in groups of 4 that form a quad,
				and then `updateState(null, quads * 2)` should be called to ensure proper batch rendering.
		
				Points are added in the following order: top-left, top-right, bottom-left, bottom-right.
			
	**/
	function addPoint(x:Float, y:Float, color:Int):Void;
	override function alloc(engine:h3d.Engine):Void;
	override function dispose():Void;
}
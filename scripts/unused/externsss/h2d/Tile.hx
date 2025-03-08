package h2d;

/**
 A core 2D rendering component representing a region of an underlying `h3d.mat.Texture`.
 
 Tiles cannot be created directly, and instances are created with the following methods:
 * Via the Resource Management system: `hxd.res.Image.toTile`.
 * From pre-existing Texture: `Tile.fromTexture`.
 * From pre-existing `BitmapData` or `Pixels`: `Tile.fromBitmap` and `Tile.fromPixels` (as well as `Tile.autoCut`).
 * From solid color: `Tile.fromColor`.
 * From previously existing Tile instance via various methods, such as `Tile.sub`.
 */
/**
	
		A core 2D rendering component representing a region of an underlying `h3d.mat.Texture`.
	
		Tiles cannot be created directly, and instances are created with the following methods:
		* Via the Resource Management system: `hxd.res.Image.toTile`.
		* From pre-existing Texture: `Tile.fromTexture`.
		* From pre-existing `BitmapData` or `Pixels`: `Tile.fromBitmap` and `Tile.fromPixels` (as well as `Tile.autoCut`).
		* From solid color: `Tile.fromColor`.
		* From previously existing Tile instance via various methods, such as `Tile.sub`.
	
**/
@:allow(h2d) @:native("h2d.Tile") extern class Tile {
	/**
		
				Visual offset of the Tile along the X axis during rendering.
			
	**/
	var dx : Float;
	/**
		
				Visual offset of the Tile along the Y axis during rendering.
			
	**/
	var dy : Float;
	/**
		
				Horizontal position of the Tile on the Texture.
		
				Cannot be modified directly, use `Tile.setPosition` instead.
			
	**/
	var x(default, null) : Float;
	/**
		
				Vertical position of the Tile on the Texture.
		
				Cannot be modified directly, use `Tile.setPosition` instead.
			
	**/
	var y(default, null) : Float;
	/**
		
				Width of the Tile.
				Not guaranteed to represent real width of the Tile on texture. (see `Tile.scaleToSize`)
		
				Cannot be modified directly, use `Tile.setSize` instead.
			
	**/
	var width(default, null) : Float;
	/**
		
				Height of the Tile.
				Not guaranteed to represent real height of the Tile on texture. (see `Tile.scaleToSize`)
		
				Cannot be modified directly, use `Tile.setSize` instead.
			
	**/
	var height(default, null) : Float;
	/**
		
				The flip state of the Tile.
				@see `Tile.flipX`
			
	**/
	var xFlip(get, set) : Bool;
	/**
		
				The flip state of the Tile.
				@see `Tile.flipY`
			
	**/
	var yFlip(get, set) : Bool;
	/**
		
				An integer horizontal position of the Tile on the Texture.
				Alias to `Math.floor(tile.x)`.
			
	**/
	var ix(get, never) : Int;
	/**
		
				An integer vertical position of the Tile on the Texture.
				Alias to `Math.floor(tile.y)`.
			
	**/
	var iy(get, never) : Int;
	/**
		
				An integer width of the Tile.
				Alias to `Math.ceil(tile.width + tile.x) - tile.ix`.
			
	**/
	var iwidth(get, never) : Int;
	/**
		
				An integer height of the Tile.
				Alias to `Math.ceil(tile.height + tile.y) - tile.iy`.
			
	**/
	var iheight(get, never) : Int;
	/**
		
				Checks if Tile or underlying Texture were disposed.
			
	**/
	function isDisposed():Bool;
	/**
		
				Create a sub-region of this Tile with specified size and offset.
				@param x The offset on top of the current Tile offset along the X axis.
				@param y The offset on top of the current Tile offset along the Y axis.
				@param w The width of the new Tile region. Can exceed current tile size.
				@param h The height of the new Tile region. Can exceed the current tile size.
				@param dx An optional visual offset of the new Tile along the X axis.
				@param dy An optional visual offset of the new Tile along the Y axis.
			
	**/
	function sub(x:Float, y:Float, w:Float, h:Float, ?dx:Float, ?dy:Float):h2d.Tile;
	/**
		
				Returns a new Tile with shifting origin point (`dx` and `dy`) to the tile center.
		
				To modify this Tile origin point, use `Tile.setCenterRatio`.
			
	**/
	function center():h2d.Tile;
	/**
		
				Flips the Tile horizontally. Note that `dx` is flipped as well.
			
	**/
	function flipX():Void;
	/**
		
				Flips the Tile vertically. Note that `dy` is flipped as well.
			
	**/
	function flipY():Void;
	/**
		
				Set the Tile position in the texture to the specified coordinate.
			
	**/
	function setPosition(x:Float, y:Float):Void;
	/**
		
				Set the Tile size in the texture to the specified dimensions.
			
	**/
	function setSize(w:Float, h:Float):Void;
	/**
		
				Rescales the Tile to be of the set width and height, but without affecting the uv coordinates.
		
				Using this method allows to upscale/downscale Tiles, but creates a mismatch between the tile uv and width/height values.
				Due to that, using any methods that modify the uv value will cause the new uv to treat scaled width and height as true dimensions
				and can lead to unexpected results if not accounted for.
			
	**/
	function scaleToSize(w:Float, h:Float):Void;
	/**
		
				Scrolls the texture position by specified amount.
			
	**/
	function scrollDiscrete(dx:Float, dy:Float):Void;
	/**
		
				Disposes of the Tile and its underlying Texture.
				Note that if Texture is used by other Tile instances, it will cause them to point at a disposed texture and can lead to errors.
			
	**/
	function dispose():Void;
	/**
		
				Create a copy of this Tile instance.
			
	**/
	function clone():h2d.Tile;
	private function get_xFlip():Bool;
	private function get_yFlip():Bool;
	private function set_xFlip(v:Bool):Bool;
	private function set_yFlip(v:Bool):Bool;
	/**
		
				Split the Tile horizontally or vertically by the number of given frames.
				@param frames The amount of frames this Tile has to be split into.
				@param vertical Causes split to be done vertically instead of horizontal split.
				@param subpixel When enabled, retains the floating-point remainder if calculated frame size is not integral.
			
	**/
	function split(?frames:Int, ?vertical:Bool, ?subpixel:Bool):Array<h2d.Tile>;
	/**
		
				Split the tile into a list of tiles of Size x Size pixels.
		
				@param size The width and height of the new Tiles.
				@param dx Optional visual offset of the new Tiles along the X axis.
				@param dy Optional visual offset of the new Tiles along the Y axis.
				@returns A one-dimensional array ordered in Y/X.
			
	**/
	function gridFlatten(size:Float, ?dx:Float, ?dy:Float):Array<h2d.Tile>;
	/**
		
				Split the tile into a list of tiles of Size x Size pixels.
		
				@param size The width and height of the new Tiles.
				@param dx Optional visual offset of the new Tiles along the X axis.
				@param dy Optional visual offset of the new Tiles along the Y axis.
				@returns A two-dimensional array ordered in `[X][Y]`.
			
	**/
	function grid(size:Float, ?dx:Float, ?dy:Float):Array<Array<h2d.Tile>>;
	@:dox(hide)
	function toString():String;
	/**
		
				Create a solid color Tile with specified width, height, color and alpha.
				@param color The RGB color of the Tile.
				@param width The width of the Tile in pixels.
				@param height The height of the Tile in pixels.
				@param alpha The transparency of the Tile.
			
	**/
	static function fromColor(color:Int, ?width:Int, ?height:Int, ?alpha:Float):h2d.Tile;
	/**
		
				Creates a new Texture from provided BitmapData and returns a Tile representing it.
			
	**/
	static function fromBitmap(bmp:hxd.BitmapData):h2d.Tile;
	/**
		
				Creates a new POT Texture from bmp and cuts it in a grid of tiles with maximum size of `[width, height]`.
		
				Algorithm will use bottom-right pixels as background color and cut out empty space from each Tile and
				will modify the origin point to retain the Tile position.
				Each row scan continues as long as there are no empty tiles.
		
				@param bmp The BitmapData which will be split into tiles.
				@param width The width of a single grid entry.
				@param height An optional height of a single grid entry. Width will be used if not provided.
			
	**/
	static function autoCut(bmp:hxd.BitmapData, width:Int, ?height:Int):{ var main : h2d.Tile; var tiles : Array<Array<h2d.Tile>>; };
	/**
		
				Create new Tile from provided Texture instance.
			
	**/
	static function fromTexture(t:h3d.mat.Texture):h2d.Tile;
	/**
		
				Creates new POT Texture from Pixels and returns a Tile representing it.
			
	**/
	static function fromPixels(pixels:hxd.Pixels):h2d.Tile;
}
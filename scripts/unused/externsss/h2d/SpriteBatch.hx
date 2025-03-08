package h2d;

/**
 A base class for `SpriteBatch` elements which can be extended with custom logic.
 
 See `BasicElement` as an example of custom element logic.
 */
/**
	
		A base class for `SpriteBatch` elements which can be extended with custom logic.
	
		See `BasicElement` as an example of custom element logic.
	
**/
@:allow(h2d.SpriteBatch) @:native("h2d.SpriteBatch") extern class BatchElement {
	/**
		
				Create a new BatchElement instance with provided Tile.
				@param t The tile used to render this BatchElement.
			
	**/
	function new(t:h2d.Tile):Void;
	/**
		
				Element X position.
			
	**/
	var x : Float;
	/**
		
				Element Y position.
			
	**/
	var y : Float;
	/**
		
				Shortcut to set both `BatchElement.scaleX` and `BatchElement.scaleY` at the same time.
		
				Equivalent to `el.scaleX = el.scaleY = scale`.
			
	**/
	var scale(never, set) : Float;
	/**
		
				X-axis scaling factor of the element.
		
				This variable is used only if `SpriteBatch.hasRotationScale` is set to `true`.
			
	**/
	var scaleX : Float;
	/**
		
				Y-axis scaling factor of the element.
		
				This variable is used only if `SpriteBatch.hasRotationScale` is set to `true`.
			
	**/
	var scaleY : Float;
	/**
		
				Element rotation in radians.
		
				This variable is used only if `SpriteBatch.hasRotationScale` is set to `true`.
			
	**/
	var rotation : Float;
	/**
		
				Red tint value (0...1 range) of the element.
			
	**/
	var r : Float;
	/**
		
				Green tint value (0...1 range) of the element.
			
	**/
	var g : Float;
	/**
		
				Blue tint value (0...1 range) of the element.
			
	**/
	var b : Float;
	/**
		
				Alpha value of the element.
			
	**/
	var a : Float;
	/**
		
				The Tile this element renders.
		
				Due to implementation specifics, this Tile instance is used only to provide rendering area, not the Texture itself,
				as `SpriteBatch.tile` used as a source of rendered texture.
			
	**/
	var t : h2d.Tile;
	/**
		
				Alpha value of the element.
				Alias of `BatchElement.a`.
			
	**/
	var alpha(get, set) : Float;
	/**
		
				If set to `false`, element will not be rendered.
			
	**/
	var visible : Bool;
	/**
		
				Reference to parent SpriteBatch instance.
			
	**/
	var batch(default, null) : h2d.SpriteBatch;
	/**
		
				Remove this BatchElement from the parent SpriteBatch instance.
			
	**/
	function remove():Void;
}

/**
 A simple `BatchElement` that provides primitive simulation of velocity, friction and gravity.
 
 Parent `SpriteBatch` should have `SpriteBatch.hasUpdate` set to `true` in order for BasicElement to work properly.
 */
/**
	
		A simple `BatchElement` that provides primitive simulation of velocity, friction and gravity.
	
		Parent `SpriteBatch` should have `SpriteBatch.hasUpdate` set to `true` in order for BasicElement to work properly.
	
**/
@:native("h2d.SpriteBatch") extern class BasicElement extends h2d.SpriteBatch.BatchElement {
	function new(t:h2d.Tile):Void;
	/**
		
				X-axis velocity of the element.
			
	**/
	var vx : Float;
	/**
		
				Y-axis velocity of the element.
			
	**/
	var vy : Float;
	/**
		
				The velocity friction.
				When not `1`, multiplies velocity by `pow(friction, dt * 60)`.
			
	**/
	var friction : Float;
	/**
		
				The gravity applied to vertical velocity in pixels per second.
			
	**/
	var gravity : Float;
}

/**
 An active batched tile renderer.
 
 Compared to `TileGroup` which is expected to be used as a static geometry,
 SpriteBatch uploads GPU buffer each frame by collecting data from added `BatchElement` instance.
 Due to that, dynamically removing and adding new geometry is fairly simple.
 
 Usage note: While SpriteBatch allows for multiple unique textures, each texture swap causes a new drawcall,
 and due to that it's recommended to minimize the amount of used textures per SpriteBatch instance,
 ideally limiting to only one texture.
 */
/**
	
		An active batched tile renderer.
	
		Compared to `TileGroup` which is expected to be used as a static geometry,
		SpriteBatch uploads GPU buffer each frame by collecting data from added `BatchElement` instance.
		Due to that, dynamically removing and adding new geometry is fairly simple.
	
		Usage note: While SpriteBatch allows for multiple unique textures, each texture swap causes a new drawcall,
		and due to that it's recommended to minimize the amount of used textures per SpriteBatch instance,
		ideally limiting to only one texture.
	
**/
@:native("h2d.SpriteBatch") extern class SpriteBatch extends h2d.Drawable {
	/**
		
				Create new SpriteBatch instance.
				@param t The Tile used as a base Texture to draw contents with.
				@param parent An optional parent `h2d.Object` instance to which SpriteBatch adds itself if set.
			
	**/
	function new(t:h2d.Tile, ?parent:h2d.Object):Void;
	/**
		
				The Tile used as a base Texture to draw contents with.
			
	**/
	var tile : h2d.Tile;
	/**
		
				Enables usage of rotation and scaling of SpriteBatch elements at the cost of extra calculus.
		
				Makes use of `BatchElement.scaleX`, `BatchElement.scaleY` and `BatchElement.rotation`.
			
	**/
	var hasRotationScale : Bool;
	/**
		
				Enables usage of `update` method in SpriteBatch elements.
			
	**/
	var hasUpdate : Bool;
	/**
		
				Adds a new BatchElement to the SpriteBatch.
				@param e The element to add.
				@param before When set, element will be added to the beginning of the element chain (rendered first).
			
	**/
	function add(e:h2d.SpriteBatch.BatchElement, ?before:Bool):h2d.SpriteBatch.BatchElement;
	/**
		
				Removes all elements from the SpriteBatch.
		
				Usage note: Does not clear the `BatchElement.batch` nor `next`/`prev` variables on the child elements.
			
	**/
	function clear():Void;
	/**
		
				Creates a new BatchElement and returns it. Shortcut to `add(new BatchElement(t))`
				@param t The Tile element will render.
			
	**/
	function alloc(t:h2d.Tile):h2d.SpriteBatch.BatchElement;
}
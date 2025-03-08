package h2d;

/**
 A base 2D class that all scene tree elements inherit from.
 
 Serves as a virtual container that does not display anything but can contain other objects
 so the various transforms are inherited to its children.
 
 Private events `Object.onAdd`, `Object.onRemove` and `Object.onHierarchyMoved` can be used
 to capture when Object is added/removed from the currently active scene as well as being moved withing the object tree.
 
 Object exposes a number of properties to control position, scale and rotation of the Object relative to its parent,
 but they are used indirectly during rendering. Instead, they are being used to calculate the absolute matrix transform
 relative to the Scene. As optimization, it's not recalculated as soon as properties are modified and delayed until
 `Object.sync`. Absolute object position can be accessed through private variables `Object.matA`, `Object.matB`,
 `Object.matC`, `Object.matD`, `Object.absX` and `Object.absY`.
 But it should be noted that in order to ensure up-to-date values, it's advised to call `Object.syncPos` before accessing them.
 */
/**
	
		A base 2D class that all scene tree elements inherit from.
	
		Serves as a virtual container that does not display anything but can contain other objects
		so the various transforms are inherited to its children.
	
		Private events `Object.onAdd`, `Object.onRemove` and `Object.onHierarchyMoved` can be used
		to capture when Object is added/removed from the currently active scene as well as being moved withing the object tree.
	
		Object exposes a number of properties to control position, scale and rotation of the Object relative to its parent,
		but they are used indirectly during rendering. Instead, they are being used to calculate the absolute matrix transform
		relative to the Scene. As optimization, it's not recalculated as soon as properties are modified and delayed until
		`Object.sync`. Absolute object position can be accessed through private variables `Object.matA`, `Object.matB`,
		`Object.matC`, `Object.matD`, `Object.absX` and `Object.absY`.
		But it should be noted that in order to ensure up-to-date values, it's advised to call `Object.syncPos` before accessing them.
	
**/
@:allow(h2d.Tools) @:native("h2d.Object") extern class Object {
	/**
		
				Create a new empty object.
				@param parent An optional parent `h2d.Object` instance to which Object adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				The parent object in the scene tree.
			
	**/
	var parent(default, null) : h2d.Object;
	/**
		
				How many immediate children this object has.
			
	**/
	var numChildren(get, never) : Int;
	/**
		
				The name of the object. Can be used to retrieve an object within a tree by using `Object.getObjectByName`.
			
	**/
	var name : String;
	/**
		
				The x position (in pixels) of the object relative to its parent.
			
	**/
	var x(default, set) : Float;
	/**
		
				The y position (in pixels) of the object relative to its parent.
			
	**/
	var y(default, set) : Float;
	/**
		
				The amount of horizontal scaling of this object.
			
	**/
	var scaleX(default, set) : Float;
	/**
		
				The amount of vertical scaling of this object.
			
	**/
	var scaleY(default, set) : Float;
	/**
		
				The rotation angle of this object, in radians.
			
	**/
	var rotation(default, set) : Float;
	/**
		
				Is the object and its children are displayed on screen.
			
	**/
	var visible(default, set) : Bool;
	/**
		
				The amount of transparency of the Object.
			
	**/
	var alpha : Float;
	/**
		
				The post process filter for this object.
		
				When set, `Object.alpha` value affects both filter and object transparency (use `Drawable.color.a` to set transparency only for the object).
			
	**/
	var filter(default, set) : h2d.filter.Filter;
	/**
		
				The blending mode of the object.
		
				If there is no `Object.filter` active, only applies to the current object (not inherited by children).
				Otherwise tells how the filter is blended with background.
			
	**/
	var blendMode : h2d.BlendMode;
	/**
		
				Return the bounds of the object for its whole content, recursively.
				@param relativeTo An optional object relative to coordinates of which bounds are returned.
				Returns bounds in the absolute coordinates if not set.
				@param out An optional bounds instance to fill. Allocates new Bounds instance and returns it if not set.
			
	**/
	function getBounds(?relativeTo:h2d.Object, ?out:h2d.col.Bounds):h2d.col.Bounds;
	/**
		
				Similar to `getBounds(parent)`, but instead of the full content, it will return
				the size based on the alignment of the object. For instance for a text, `Object.getBounds` will return
				the full glyphs size whereas `getSize` will ignore the pixels under the baseline.
				@param out An optional bounds instance to fill. Allocates new Bounds instance and returns it if not set.
			
	**/
	function getSize(?out:h2d.col.Bounds):h2d.col.Bounds;
	/**
		
				Tells if the object is contained into this object children, recursively.
			
	**/
	function contains(o:h2d.Object):Bool;
	/**
		
				Find a single object in the tree by calling `f` on each and returning the first not-null value returned, or null if not found.
			
	**/
	function find<T>(f:T):T;
	/**
		
				Find several objects in the tree by calling `f` on each and returning all the not-null values returned.
				@param arr An optional array instance to fill results with. Allocates a new array if not set.
			
	**/
	function findAll<T>(f:T, ?arr:Array<T>):Array<T>;
	private function set_filter(f:h2d.filter.Filter):h2d.filter.Filter;
	/**
		
				Return the total number of children in the whole tree, recursively.
			
	**/
	function getObjectsCount():Int;
	/**
		
				Convert a local position (or `[0,0]` if `pt` is null) relative to the object origin into an absolute screen position, applying all the inherited transforms.
				@param pt An optional position to convert and return. Allocates new Point at 0,0 position if not set. Modifies the Point instance as is.
			
	**/
	function localToGlobal(?pt:h2d.col.Point):h2d.col.Point;
	/**
		
				Convert an absolute screen position into a local position relative to the object origin, applying all the inherited transforms.
				@param pt A position to convert and return. Modifies the Point instance as is.
			
	**/
	function globalToLocal(pt:h2d.col.Point):h2d.col.Point;
	/**
		
				Returns an `h2d.Scene` down the hierarchy tree or `null` if object is not added to Scene.
			
	**/
	function getScene():h2d.Scene;
	private function set_visible(b:Bool):Bool;
	/**
		
				Add a child object at the end of the children list.
			
	**/
	function addChild(s:h2d.Object):Void;
	/**
		
				Insert a child object at the specified position of the children list.
			
	**/
	function addChildAt(s:h2d.Object, pos:Int):Void;
	/**
		
				Remove the given object from the immediate children list of the object if it's part of it.
			
	**/
	function removeChild(s:h2d.Object):Void;
	/**
		
				Remove all children from the immediate children list.
			
	**/
	function removeChildren():Void;
	/**
		
				Draw the object and all its children into the given Texture.
			
	**/
	function drawTo(t:h3d.mat.Texture):Void;
	/**
		
				Draw the object and all its children into the given Textures.
			
	**/
	function drawToTextures(texs:Array<h3d.mat.Texture>, outputs:Array<hxsl.Output>):Void;
	/**
		
				Move the object by the specified amount along its current direction (`Object.rotation` angle).
			
	**/
	function move(dx:Float, dy:Float):Void;
	/**
		
				Return the `n`th element among the immediate children list of this object, or `null` if there is no Object at this position.
			
	**/
	function getChildAt(n:Int):h2d.Object;
	/**
		
				Return the index of the object `o` within the immediate children list of this object, or `-1` if it is not part of the children list.
			
	**/
	function getChildIndex(o:h2d.Object):Int;
	/**
		
				Search for an object recursively by name, return `null` if not found.
			
	**/
	function getObjectByName(name:String):h2d.Object;
}
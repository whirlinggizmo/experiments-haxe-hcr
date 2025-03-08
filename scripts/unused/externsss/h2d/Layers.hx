package h2d;

/**
 A layer-based container for Objects.
 
 Hierarchically organizes objects based on their layer.
 Supports per-layer Y-sorting through `Layers.ysort`.
 */
/**
	
		A layer-based container for Objects.
	
		Hierarchically organizes objects based on their layer.
		Supports per-layer Y-sorting through `Layers.ysort`.
	
**/
@:native("h2d.Layers") extern class Layers extends h2d.Object {
	/**
		
				Create a new Layers instance.
				@param parent An optional parent `h2d.Object` instance to which Layers adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				Adds a child object `s` at the end of the topmost layer.
				@param s An object to be added.
			
	**/
	@:dox(show)
	override function addChild(s:h2d.Object):Void;
	/**
		
			 * Adds a child object `s` at the end of the given `layer`.
			 * @param s An object to be added.
			 * @param layer An index of the layer the object should be added at with 0 being the bottom-most layer. Pass -1 to use topmost layer.
			 * @param index An optional index at which the object should be inserted inside the layer. Pass -1 to append to the end.
			 
	**/
	function add(s:h2d.Object, ?layer:Int, ?index:Int):Void;
	/**
		
				Adds a child object `s` at specified `index` on the top topmost layer.
		
				Warning: Previous behavior of `Layers.addChildAt` is no longer applicable and `Layers.add` should be used instead.
				@param s The object to be added.
				@param index The position of the object in the layer.
			
	**/
	@:dox(show)
	override function addChildAt(s:h2d.Object, index:Int):Void;
	override function removeChild(s:h2d.Object):Void;
	/**
		
				Moves an object `s` to the bottom of its layer (rendered first, behind the other Objects in the layer).
				Causes `Object.onHierarchyMoved` on the Object.
				@param s An object to be moved.
			 
	**/
	function under(s:h2d.Object):Void;
	/**
		
				Moves an object `s` to the top of its layer (rendered last, in front of other Objects in layer).
				Causes `Object.onHierarchyMoved` on the Object.
				@param s An object to be moved.
			 
	**/
	function over(s:h2d.Object):Void;
	/**
		
				Returns an Iterator with objects in a specified `layer`.
				Returns an empty iterator if no objects are present in the layer.
		
				Objects added or removed from Layers during iteration do not affect the output of the Iterator.
		
				@param layer A layer index to iterate over.
			 
	**/
	function getLayer(layer:Int):Iterator<h2d.Object>;
	/**
		
				Return the `n`th element among the immediate children list on the `layer`, or null if there is none.
				@param layer The layer children of which are used. Pass -1 to use the topmost layer.
			
	**/
	function getChildAtLayer(n:Int, layer:Int):h2d.Object;
	/**
		
				Returns the layer on which the child `s` resides on.
				@param s An object to look up to.
				@return An index of the layer where the object resides on or `-1` if `s` is not a child of the Layers.
			 
	**/
	function getChildLayer(s:h2d.Object):Int;
	/**
		
				Return the index of the child within its respective layer.
				@param o The child to look up index of.
				@returns `-1` if object is not a child of Layers, index of the child within its current layer otherwise.
			
	**/
	function getChildIndexInLayer(o:h2d.Object):Int;
	/**
		
				Sorts specified layer based on `Object.y` value of it's children.
				Causes `Object.onHierarchyChanged` on moved children.
				@param layer An index of the layer to sort.
			 
	**/
	function ysort(layer:Int):Void;
}
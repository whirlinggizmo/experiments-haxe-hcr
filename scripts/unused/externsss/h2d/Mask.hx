package h2d;

/**
 Restricts rendering area within the `[width, height]` rectangle.
 For more advanced masking, see `h2d.filter.AbstractMask`.
 
 Rotation of the mask does not rotate the masked area and instead causes it to cover the bounding box of the mask.
 
 The `Mask.maskWidth` and `Mask.unmask` can be used to mask out rendering area without direct usage of Mask instance in-between.
 */
/**
	
		Restricts rendering area within the `[width, height]` rectangle.
		For more advanced masking, see `h2d.filter.AbstractMask`.
	
		Rotation of the mask does not rotate the masked area and instead causes it to cover the bounding box of the mask.
	
		The `Mask.maskWidth` and `Mask.unmask` can be used to mask out rendering area without direct usage of Mask instance in-between.
	
**/
@:native("h2d.Mask") extern class Mask extends h2d.Object {
	/**
		
				Create a new Mask instance.
				@param width The width of the masked area.
				@param height The height of the masked area.
				@param parent An optional parent `h2d.Object` instance to which Mask adds itself if set.
			
	**/
	function new(width:Int, height:Int, ?parent:h2d.Object):Void;
	/**
		
				The width of the masked area.
			
	**/
	var width : Int;
	/**
		
				The height of the masked area.
			
	**/
	var height : Int;
	/**
		
				Horizontal scroll offset of the Mask content in pixels. Can be clamped by `Mask.scrollBounds`.
			
	**/
	var scrollX(default, set) : Float;
	/**
		
				Vertical scroll offset of the Mask content in pixels. Can be clamped by `Mask.scrollBounds`.
			
	**/
	var scrollY(default, set) : Float;
	/**
		
				Optional scroll boundaries that prevent content from overscroll.
			
	**/
	var scrollBounds : h2d.col.Bounds;
	/**
		
				Scroll the Mask content to the specified offset.
			
	**/
	function scrollTo(x:Float, y:Float):Void;
	/**
		
				Scroll the Mask content by the specified offset relative to the current scroll offset.
			
	**/
	function scrollBy(x:Float, y:Float):Void;
	private function set_scrollX(v:Float):Float;
	private function set_scrollY(v:Float):Float;
	/**
		
				Masks render zone based off object position and given dimensions.
				Should call `Mask.unmask()` afterwards.
				@param ctx The render context to mask.
				@param object An Object which transform will be used as mask origin.
				@param width The width of the mask in scene coordinate space.
				@param height The height of the mask in scene coordinate space.
				@param scrollX Additional horizontal offset of the masked area.
				@param scrollY Additional vertical offset of the masked area.
			
	**/
	@:access(h2d.RenderContext)
	static function maskWith(ctx:h2d.RenderContext, object:h2d.Object, width:Int, height:Int, ?scrollX:Float, ?scrollY:Float):Void;
	/**
		
				Unmasks the previously masked area from `Mask.maskWith`.
				@param ctx The render context to unmask.
			
	**/
	static function unmask(ctx:h2d.RenderContext):Void;
}
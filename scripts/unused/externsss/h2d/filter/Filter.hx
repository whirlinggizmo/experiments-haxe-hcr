package h2d.filter;

/**
 The base filter class, you can extend it in order to define your own filters, although ShaderFilter will be the most straightforward way to define simple custom filter.
 
 Keep in mind that filters use internal Object resolution to render its content, hence scaling of the filtered object would not increase the rendering resolution.
 For example, 20x20px `Bitmap` with `scale = 2` will render onto 20x20 filter texture if filter is attached to it directly,
 but if filter is attached to the parent of that bitmap, filter will render 40x40 texture.
 Another thing to be aware of, is that `Scene.scaleMode` does not affect filter resolution either,
 and upscaling contents with `scaleMode` would not upscale the resolution of filtered content.
 
 Filters limit their render area dictated by bound object boundaries, `Filter.autoBounds` and `Filter.boundsExtend` variables and `Filter.getBounds` method.
 See their respective docs for details.
 
 For optimization purposes, rendering boundaries are clipped by scene viewport and nothing will be rendered offscreen.
 */
/**
	
		The base filter class, you can extend it in order to define your own filters, although ShaderFilter will be the most straightforward way to define simple custom filter.
	
		Keep in mind that filters use internal Object resolution to render its content, hence scaling of the filtered object would not increase the rendering resolution.
		For example, 20x20px `Bitmap` with `scale = 2` will render onto 20x20 filter texture if filter is attached to it directly,
		but if filter is attached to the parent of that bitmap, filter will render 40x40 texture.
		Another thing to be aware of, is that `Scene.scaleMode` does not affect filter resolution either,
		and upscaling contents with `scaleMode` would not upscale the resolution of filtered content.
	
		Filters limit their render area dictated by bound object boundaries, `Filter.autoBounds` and `Filter.boundsExtend` variables and `Filter.getBounds` method.
		See their respective docs for details.
	
		For optimization purposes, rendering boundaries are clipped by scene viewport and nothing will be rendered offscreen.
	
**/
@:native("h2d.filter.Filter") extern class Filter {
	/**
		
				When enabled, rendering bounds of the filter will be expanded by `Filter.boundsExtend` in all directions.
				Otherwise filter should provide custom bounds through `Filter.getBounds` call.
				Default : true.
			
	**/
	var autoBounds : Bool;
	/**
		
				Rendering texture boundaries extent. Increases the rendering area by twice the `Filter.boundsExtend` value.
				Automatically applied to object bounds when `autoBounds = true` or `Filter.getBounds` is not overridden.
				Does not affect boundaries when `autoBounds = true` and `boundsExtend` is less than 0.
			
	**/
	var boundsExtend : Float;
	/**
		
				When enabled, filters on not Object which are not Drawable will use bilinear filtering when displayed
				and some filter will also use bilinear filtering on intermediate textures.
			
	**/
	var smooth : Bool;
	/**
		
				When filter is disabled, attached object will render as usual.
			
	**/
	@:isVar
	var enable(get, set) : Bool;
	/**
		
				Custom rendering resolution scaling of the filter.
		
				Stacks with additional scaling from `Filter.useResolutionScaling` if enabled.
			
	**/
	var resolutionScale(default, set) : Float;
	/**
		
				Use the screen resolution to upscale/downscale the filter rendering resolution.
		
				Stacks with additional scaling from `Filter.resolutionScale` if enabled.
			
	**/
	var useScreenResolution(default, set) : Bool;
	private function get_enable():Bool;
	private function set_enable(v:Bool):Bool;
	private function set_resolutionScale(v:Float):Float;
	private function set_useScreenResolution(v:Bool):Bool;
	/**
		
				Used to sync data for rendering.
			
	**/
	function sync(ctx:h2d.RenderContext, s:h2d.Object):Void;
	/**
		
				Sent when filter is bound to an Object `s`.
				If Object was not yet allocated, method will be called when it's added to allocated Scene.
			
	**/
	function bind(s:h2d.Object):Void;
	/**
		
				Sent when filter was unbound from an Object `s`.
				Method won't be called if Object was not yet allocated.
			
	**/
	function unbind(s:h2d.Object):Void;
	/**
		
				Method should populate `bounds` with rendering boundaries of the Filter for Object `s`.
				Initial `bounds` contents are undefined and it's recommended to either clear them or call `s.getBounds(s, bounds)`.
				Only used when `Filter.autoBounds` is `false`.
		
				By default uses given Object bounds and extends them with `Filter.boundsExtend`.
				Compared to `autoBounds = true`, negative `boundsExtend` are still applied, causing rendering area to shrink.
		
				@param s The Object instance to which the filter is applied.
				@param bounds The Bounds instance which should be populated by the filter boundaries.
				@param scale Contains the desired rendering resolution scaling which should be accounted when constructing the bounds.
				Can be edited to override provided scale values.
			
	**/
	function getBounds(s:h2d.Object, bounds:h2d.col.Bounds, scale:h2d.col.Point):Void;
	/**
		
				Renders the filter onto Texture in `input` Tile.
			
	**/
	function draw(ctx:h2d.RenderContext, input:h2d.Tile):h2d.Tile;
	/**
		
				Defines default value for `Filter.useResolutionScaling`.
			
	**/
	static var defaultUseScreenResolution : Bool;
}
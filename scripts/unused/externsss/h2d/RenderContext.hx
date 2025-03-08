package h2d;

/**
 A 2D scene renderer.
 
 Passed during `Object.sync` and `Object.drawRec` and can be accessed directly via `Scene.renderer`.
 */
/**
	
		A 2D scene renderer.
	
		Passed during `Object.sync` and `Object.drawRec` and can be accessed directly via `Scene.renderer`.
	
**/
@:access(h2d.Scene) @:native("h2d.RenderContext") extern class RenderContext extends h3d.impl.RenderContext {
	/**
		
				Create a new RenderContext and attach it to specified Scene.
				@param scene The scene which RenderContext will render.
			
	**/
	function new(scene:h2d.Scene):Void;
	/**
		
				Current transparency value used for rendering objects.
				Automatically managed by `Object`.
			
	**/
	var globalAlpha : Float;
	/**
		
				Temporary vertex buffer used to emit Tiles when `RenderContext.BUFFERING` is on.
				Otherwise it's `null`. Internal usage only.
			
	**/
	@:dox(hide)
	var buffer : hxd.FloatBuffer;
	/**
		
				Current temporary buffer position. Internal usage only.
			
	**/
	@:dox(hide)
	var bufPos : Int;
	/**
		
				The 2D scene attached to this RenderContext instance.
			
	**/
	var scene : h2d.Scene;
	/**
		
				<span class="label">Internal usage</span>
		
				Determines texture filtering method (Linear or Nearest).
				Not recommended to use - assign `Scene.defaultSmooth` instead.
			
	**/
	var defaultSmooth : Bool;
	/**
		
				When enabled, pixels with alpha value below 0.001 will be discarded.
			
	**/
	var killAlpha : Bool;
	/**
		
				When enabled, causes `Object` to render its children in reverse order.
			
	**/
	var front2back : Bool;
	/**
		
				Sent before Drawable is rendered.
				Drawable won't be rendered if callback returns `false`.
			
	**/
	var onBeginDraw : h2d.Drawable -> Bool;
	/**
		
				Sent before filter begins rendering.
				Filter (and it's object tree) won't be rendered if callback returns `false`.
			
	**/
	var onEnterFilter : h2d.Object -> Bool;
	/**
		
				Send after filter has been rendered.
			
	**/
	var onLeaveFilter : h2d.Object -> Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Used to calculate filter rendering bounds.
			
	**/
	@:dox(hide)
	var tmpBounds : h2d.col.Bounds;
	/**
		
				The camera instance that is currently being rendered, if present, `null` otherwise.
			
	**/
	var currentCamera(default, null) : h2d.Camera;
	override function dispose():Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Prepares RenderContext to begin rendering a new frame.
			
	**/
	function begin():Void;
	/**
		
				Allocated a cached render target Texture with specified name, filter mode and current `Scene.width` and `Scene.height`.
				@returns Either precached Texture under same name or newly allocated one.
			
	**/
	function allocTarget(name:String, ?filter:Bool):h3d.mat.Texture;
	/**
		
				Clears current render target with specified color.
			
	**/
	function clear(color:Int):Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Performers cleanup after frame is rendered.
			
	**/
	function end():Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Applies Camera `cam` transform to current viewport and pushes it onto the camera stack.
				Should call `RenderContext.popCamera` when rendering is complete.
			
	**/
	@:access(h2d.Camera)
	function pushCamera(cam:h2d.Camera):Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Restores previous viewport state prior to camera rendering, removing it from the camera stack.
			
	**/
	function popCamera():Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Prepares to render Filter and pushes provided Object onto filter stack.
		
				@returns true if filter is allowed to render, false otherwise (see `RenderContext.onEnterFilter`)
			
	**/
	function pushFilter(spr:h2d.Object):Bool;
	/**
		
				<span class="label">Internal usage</span>
		
				Sets the current filter texture resolution scale factor.
			
	**/
	function setFilterScale(scaleX:Float, scaleY:Float):Void;
	/**
		
				Retrieves the current filter scale factor.
		
				@param into The 2D Point instance into which the scale is written. Creates a new Point if null.
				@returns The current filter resolution scale or `{ 1, 1 }` point.
			
	**/
	function getFilterScale(?into:h2d.col.Point):h2d.col.Point;
	/**
		
				<span class="label">Internal usage</span>
		
				Finalizes Filter rendering and removes top-most Object from filter stack.
			
	**/
	function popFilter():Void;
	/**
		
				Sets provided texture as a render target and pushes it onto target stack.
				If only part of the Texture should be rendered onto, method should be used with `pushRenderZone()` to avoid rendering outside specified texture area.
		
				@param t Texture to which RenderContext will render to. Texture should be allocated as a render target (have `Target` flag).
				@param startX X offset of rendering area on the Texture.
				@param startY Y offset of rendering area on the Texture.
				@param width Width of the clipping area on the Texture. If equals to `-1`, will use texture width.
				@param height Height of the clipping area on the Texture. If equals to `-1` will use texture height.
			
	**/
	function pushTarget(t:h3d.mat.Texture, ?startX:Int, ?startY:Int, ?width:Int, ?height:Int):Void;
	/**
		
				Pushes an array of render targets onto target stack.
			
	**/
	function pushTargets(texs:Array<h3d.mat.Texture>):Void;
	/**
		
				Pops current render target from the target stack.
				If last texture was removed from the stack, will restore the primary render buffer as a render target.
			
	**/
	function popTarget():Void;
	/**
		
				Sets rectangular render zone area, saving previous render zone settings.
				To respect previous render zone area, use `RenderContext.clipRenderZone` method.
		
				`RenderContext.popRenderZone` should be called afterwards to clear render zone stack.
			
	**/
	function pushRenderZone(x:Float, y:Float, w:Float, h:Float):Void;
	/**
		
				Restores previous render zone settings.
			
	**/
	function popRenderZone():Void;
	function getCurrentRenderZone(?bounds:h2d.col.Bounds):h2d.col.Bounds;
	/**
		
				Pushes new render zone with respect to the old render zone settings by clipping new and old render zones,
				pushing the intersection area result.
				Used so that any call to the clipRenderZone respects the already set zone, and can't render outside of it.
			
	**/
	function clipRenderZone(x:Float, y:Float, w:Float, h:Float):Void;
	/**
		
				Renders the assigned Scene. Same as `s2d.drawRec(s2d.renderer)`.
			
	**/
	function drawScene():Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Should be called before performing a new draw call in order to sync shader data and other parameters.
			
	**/
	function beforeDraw():Void;
	/**
		
				Prepares rendering with BatchState.
				Each state draw should be preceded with `swapTexture` call.
			
	**/
	@:access(h2d.Drawable)
	function beginDrawBatchState(obj:h2d.Drawable):Bool;
	/**
		
				Prepares rendering of the Drawable object with specified texture.
				@returns true if rendering is prepared, false otherwise (see `RenderContext.onBeginDraw`)
			
	**/
	@:access(h2d.Drawable)
	function beginDrawObject(obj:h2d.Drawable, texture:h3d.mat.Texture):Bool;
	/**
		
				Begins buffered Tile render of the Drawable object.
				@returns true if rendering is prepared, false otherwise (see `RenderContext.onBeginDraw`)
			
	**/
	@:dox(hide)
	@:access(h2d.Drawable)
	function beginDrawBatch(obj:h2d.Drawable, texture:h3d.mat.Texture):Bool;
	/**
		
				Renders a Tile with the transform of the given Drawable.
		
				@returns `true` if tile was drawn, `false` otherwise.
				Tile is not drawn if it's either outside of the rendering area or was cancelled by `RenderContext.onBeginDraw`.
			
	**/
	@:access(h2d.Drawable)
	function drawTile(obj:h2d.Drawable, tile:h2d.Tile):Bool;
	override function setCurrent():Void;
}
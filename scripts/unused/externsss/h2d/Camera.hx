package h2d;

/**
 A 2D camera representation attached to `h2d.Scene`.
 
 Enables ability to move, scale and rotate the scene viewport.
 
 Scene supports usage of multiple Camera instances.
 To configure which layers each Camera renders - `Camera.layerVisible` method should be overridden.
 By default, camera does not clip out the contents that are outside camera bounding box, which can be enabled through `Camera.clipViewport`.
 
 Due to Heaps event handling structure, only one Camera instance can handle the mouse/touch input, and can be set through `h2d.Scene.interactiveCamera` variable.
 Note that during even handing, interactive camera does not check if the Camera itself is visible nor the layers filters as well as `clipViewport` is not applied.
 */
/**
	
		A 2D camera representation attached to `h2d.Scene`.
	
		Enables ability to move, scale and rotate the scene viewport.
	
		Scene supports usage of multiple Camera instances.
		To configure which layers each Camera renders - `Camera.layerVisible` method should be overridden.
		By default, camera does not clip out the contents that are outside camera bounding box, which can be enabled through `Camera.clipViewport`.
	
		Due to Heaps event handling structure, only one Camera instance can handle the mouse/touch input, and can be set through `h2d.Scene.interactiveCamera` variable.
		Note that during even handing, interactive camera does not check if the Camera itself is visible nor the layers filters as well as `clipViewport` is not applied.
	
**/
@:access(h2d.RenderContext) @:access(h2d.Scene) @:allow(h2d.Scene) @:native("h2d.Camera") extern class Camera {
	/**
		
				Create a new Camera instance and attach to the given `scene`.
				@param scene Optional owner Scene to which camera auto-attaches to.
				Note that when Camera is not attached to the Scene, a number of methods would lead to an error if called.
			
	**/
	function new(?scene:h2d.Scene):Void;
	/**
		
				X position of the camera in world space based on anchorX.
			
	**/
	var x(default, set) : Float;
	/**
		
				Y position of the camera in world space based on anchorY.
			
	**/
	var y(default, set) : Float;
	/**
		
				Horizontal scale factor of the camera. Scaling applied, using anchored position as pivot.
			
	**/
	var scaleX(default, set) : Float;
	/**
		
				Vertical scale factor of the camera. Scaling applied, using anchored position as pivot.
			
	**/
	var scaleY(default, set) : Float;
	/**
		
				Rotation of the camera in radians. Camera is rotated around anchored position.
			
	**/
	var rotation(default, set) : Float;
	/**
		
				Enables viewport clipping. Allow to restrict rendering area of the camera to the viewport boundaries.
		
				Does not affect the user input when Camera is set as interactive camera.
			
	**/
	var clipViewport : Bool;
	/**
		
				Horizontal viewport offset of the camera relative to internal scene viewport (see `h2d.Scene.scaleMode`) in scene coordinates. ( default : 0 )  
				Automatically scales on scene resize.
			
	**/
	var viewportX(get, set) : Float;
	/**
		
				Vertical viewport offset of the camera relative to internal scene viewport (see `h2d.Scene.scaleMode`) in scene coordinates. ( default : 0 )  
				Automatically scales on scene resize.
			
	**/
	var viewportY(get, set) : Float;
	/**
		
				Camera viewport width in scene coordinates. ( default : scene.width )  
				Automatically scales on scene resize.
			
	**/
	var viewportWidth(get, set) : Float;
	/**
		
				Camera viewport height in scene coordinates. ( default: scene.height )  
				Automatically scales on scene resize.
			
	**/
	var viewportHeight(get, set) : Float;
	/**
		
				Horizontal anchor position inside viewport boundaries used for positioning and resize compensation. ( default : 0 )  
				Value is a percentile (0..1) from left viewport edge to right viewport edge with 0.5 being center.
			
	**/
	var anchorX(default, set) : Float;
	/**
		
				Vertical anchor position inside viewport boundaries used for positioning and resize compensation. ( default : 0 )  
				Value is a percentile (0..1) from top viewport edge to bottom viewport edge with 0.5 being center.
			
	**/
	var anchorY(default, set) : Float;
	/**
		
				Camera visibility.
		
				Does not affect the user input when Camera is set as interactive camera.
			
	**/
	var visible : Bool;
	/**
		
				Makes camera to follow the referenced Object position.
			
	**/
	var follow : h2d.Object;
	/**
		
				Enables `h2d.Object.rotation` sync between `Camera.follow` object and Camera.
			
	**/
	var followRotation : Bool;
	/**
		
				Override this method to set visibility only to specific layers. Renders all layers by default.
		
				Does not affect the user input when Camera is set as interactive camera.
		
				Usage example:
		
				```haxe
				final LAYER_SHARED = 0;
				final LAYER_PLAYER_1 = 2;
				final LAYER_PLAYER_2 = 3;
				final LAYER_UI = 4;
				// Set first camera to only render shared layer and one that only visible to player 1.
				s2d.camera.layerVisible = (layer) -> layer == LAYER_SHARED || layer == LAYER_PLAYER_1;
				var player2 = new h2d.Camera(s2d);
				// Set second camera to only render shared layer and one that only visible to player 2.
				player2.layerVisible = (layer) -> layer == LAYER_SHARED || layer == LAYER_PLAYER_2;
				var ui = new h2d.Camera(s2d);
				// Set last camera to only render UI layer.
				ui.layerVisible = (layer) -> layer == LAYER_UI;
				```
		
				@param layer The rendered layer index in `h2d.Scene`.
				@returns `true` if layer can be rendered, `false` otherwise.
		
			
	**/
	function layerVisible(layer:Int):Bool;
	/**
		
				<span class="label">Internal usage</span>
		
				Prepares RenderContext to render the camera contents and clips viewport if necessary. Should call `Camera.exit` afterwards.
			
	**/
	@:dox(hide)
	@:noCompletion
	function enter(ctx:h2d.RenderContext):Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Causes RenderContext to restore the state prior to camera rendering. Should be called after `Camera.enter` when rendering is finished.
			
	**/
	@:dox(hide)
	@:noCompletion
	function exit(ctx:h2d.RenderContext):Void;
	/**
		
				<span class="label">Internal usage</span>
		
				Synchronizes the camera transform matrix.
			
	**/
	@:access(h2d.Object)
	@:dox(hide)
	@:noCompletion
	function sync(ctx:h2d.RenderContext, ?force:Bool):Void;
	/**
		
				<span class="label">Internal usage</span>
				Convert `Event.relX` and `Event.relY` to local camera position.
			
	**/
	@:dox(hide)
	@:noCompletion
	function eventToCamera(e:hxd.Event):Void;
	/**
		
				Convert screen position into a local camera position.
		
				Requires Camera being attached to a Scene.
			
	**/
	function screenToCamera(pt:h2d.col.Point):Void;
	/**
		
				Convert local camera position to absolute screen position.
		
				Requires Camera being attached to a Scene.
			
	**/
	function cameraToScreen(pt:h2d.col.Point):Void;
	/**
		
				Convert an absolute scene position into a local camera position.
				Does not represent screen position, see `Camera.screenToCamera` to convert position with accounting of `scaleMode`.
		
				Requires Camera being attached to a Scene.
			
	**/
	function sceneToCamera(pt:h2d.col.Point):Void;
	/**
		
				Convert local camera position into absolute scene position.
				Does not represent screen position, see `Camera.cameraToScreen` to convert position with accounting of `scaleMode`.
		
				Requires Camera being attached to a Scene.
			
	**/
	function cameraToScene(pt:h2d.col.Point):Void;
}
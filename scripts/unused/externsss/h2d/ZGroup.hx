package h2d;

@:dox(hide) @:native("h2d.ZGroup") extern class DepthMap {
	function new():Void;
	function build(spr:h2d.Object):Void;
	function clear():Void;
}

/**
 An advanced double-pass rendering class that utilizes a z-culling on an opaque objects.
 
 For optimization to work properly, all opaque objects should have `Object.blendMode` set to `None`.
 
 Rendering is done in two passes:
 * An opaque pass only renders objects with `blendeMode = None`, with `RenderContext.front2back` and `RenderContext.killAlpha` enabled.
 * Transparent pass renders the rest of the objects (which are not marked as opaque) as usual.
 
 That allows to perform a z-cull depth test on the objects and reduce the overall GPU strain.
 
 Additionally, ZGroup places a limitation on filter usage. They are not drawn in opaque pass, which can lead to undefined behavior.
 */
/**
	
		An advanced double-pass rendering class that utilizes a z-culling on an opaque objects.
	
		For optimization to work properly, all opaque objects should have `Object.blendMode` set to `None`.
	
		Rendering is done in two passes:
		* An opaque pass only renders objects with `blendeMode = None`, with `RenderContext.front2back` and `RenderContext.killAlpha` enabled.
		* Transparent pass renders the rest of the objects (which are not marked as opaque) as usual.
	
		That allows to perform a z-cull depth test on the objects and reduce the overall GPU strain.
	
		Additionally, ZGroup places a limitation on filter usage. They are not drawn in opaque pass, which can lead to undefined behavior.
	
**/
@:access(h2d.RenderContext) @:native("h2d.ZGroup") extern class ZGroup extends h2d.Layers {
	/**
		
				Create a new ZGroup instance/
				@param parent An optional parent `h2d.Object` instance to which ZGroup adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
}
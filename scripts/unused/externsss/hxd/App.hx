package hxd;

/**
 Base class for a Heaps application.
 
 This class contains code to set up a typical Heaps app,
 including 3D and 2D scene, input, update and loops.
 
 It's designed to be a base class for an application entry point,
 and provides several methods for overriding, in which we can plug
 custom code. See API documentation for more information.
 */
/**
	
		Base class for a Heaps application.
	
		This class contains code to set up a typical Heaps app,
		including 3D and 2D scene, input, update and loops.
	
		It's designed to be a base class for an application entry point,
		and provides several methods for overriding, in which we can plug
		custom code. See API documentation for more information.
	
**/
@:native("hxd.App") extern class App implements h3d.IDrawable {
	function new():Void;
	/**
		
				Rendering engine.
			
	**/
	var engine(default, null) : h3d.Engine;
	/**
		
				Default 3D scene.
			
	**/
	var s3d(default, null) : h3d.scene.Scene;
	/**
		
				Default 2D scene.
			
	**/
	var s2d(default, null) : h2d.Scene;
	/**
		
				Input event listener collection.
				Both 2D and 3D scenes are added to it by default.
			
	**/
	var sevents(default, null) : hxd.SceneEvents;
	/**
		
				Switch either the 2d or 3d scene with another instance, both in terms of rendering and event handling.
				If you call disposePrevious, it will call dispose() on the previous scene.
			
	**/
	function setScene(scene:hxd.SceneEvents.InteractiveScene, ?disposePrevious:Bool):Void;
	/**
		
			 * When using multiple hxd.App, this will set the current App (the one on which update etc. will be called)
			
	**/
	function setCurrent():Void;
	function render(e:h3d.Engine):Void;
}
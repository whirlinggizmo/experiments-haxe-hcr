package hxd;

@:native("hxd.Window") extern class Window {
	function new(?canvas:js.html.CanvasElement, ?globalEvents:Bool):Void;
	var width(get, never) : Int;
	var height(get, never) : Int;
	var mouseX(get, never) : Int;
	var mouseY(get, never) : Int;
	@:deprecated("Use mouseMode = AbsoluteUnbound(true)")
	var mouseLock(get, set) : Bool;
	/**
		
				If set, will restrain the mouse cursor within the window boundaries.
			
	**/
	var mouseClip(get, set) : Bool;
	/**
		
				Set the mouse movement input handling mode.
		
				@see `hxd.impl.MouseMode` for more details on each mode.
			
	**/
	var mouseMode(default, set) : hxd.impl.MouseMode;
	var vsync(get, set) : Bool;
	var isFocused(get, never) : Bool;
	var propagateKeyEvents : Bool;
	var title(get, set) : String;
	var displayMode(get, set) : hxd.Window.DisplayMode;
	/**
		
				When enabled, the browser zoom does not affect the canvas.
				(default : true)
			
	**/
	var useScreenPixels : Bool;
	/**
		
				When enabled, the user click event on the canvas that would trigger mouse capture to be enabled would be discarded.
				(default : true)
			
	**/
	var discardMouseCaptureEvent : Bool;
	function dispose():Void;
	function onClose():Bool;
	function onMouseModeChange(from:hxd.impl.MouseMode, to:hxd.impl.MouseMode):hxd.impl.MouseMode;
	function event(e:hxd.Event):Void;
	function addEventTarget(et:hxd.Event -> Void):Void;
	function removeEventTarget(et:hxd.Event -> Void):Void;
	function addResizeEvent(f:() -> Void):Void;
	function removeResizeEvent(f:() -> Void):Void;
	function resize(width:Int, height:Int):Void;
	function addDragAndDropTarget(f:(event:hxd.DropFileEvent) -> Void):Void;
	function removeDragAndDropTarget(f:(event:hxd.DropFileEvent) -> Void):Void;
	@:deprecated("Use the displayMode property instead")
	function setFullScreen(v:Bool):Void;
	function setCursorPos(x:Int, y:Int, ?emitEvent:Bool):Void;
	function setCurrent():Void;
	private function get_width():Int;
	private function get_height():Int;
	private function get_mouseX():Int;
	private function get_mouseY():Int;
	@:deprecated("Use mouseMode = AbsoluteUnbound(true)")
	private function get_mouseLock():Bool;
	@:deprecated("Use mouseMode = AbsoluteUnbound(true)")
	private function set_mouseLock(v:Bool):Bool;
	private function get_mouseClip():Bool;
	private function set_mouseClip(v:Bool):Bool;
	private function set_mouseMode(v:hxd.impl.MouseMode):hxd.impl.MouseMode;
	private function get_vsync():Bool;
	private function set_vsync(b:Bool):Bool;
	private function get_isFocused():Bool;
	private function get_displayMode():hxd.Window.DisplayMode;
	private function set_displayMode(m:hxd.Window.DisplayMode):hxd.Window.DisplayMode;
	private function get_title():String;
	private function set_title(t:String):String;
	static function getInstance():hxd.Window;
}

@:native("hxd.Window") extern enum DisplayMode {
	Windowed;
	Borderless;
	Fullscreen;
	FullscreenResize;
}
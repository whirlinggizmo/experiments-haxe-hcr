package hxd;

@:native("hxd.System") extern enum Platform {
	IOS;
	Android;
	WebGL;
	PC;
	Console;
	FlashPlayer;
}

@:native("hxd.System") extern enum SystemValue {
	IsTouch;
	IsWindowed;
	IsMobile;
}

@:native("hxd.System") extern class System {
	static var width(get, never) : Int;
	static var height(get, never) : Int;
	static var lang(get, never) : String;
	static var platform(get, never) : hxd.System.Platform;
	static var screenDPI(get, never) : Float;
	static var setCursor : (c:hxd.Cursor) -> Void;
	static var allowTimeout(get, set) : Bool;
	static function timeoutTick():Void;
	/**
		 If greater than 0, this will reduce loop framerate to reduce CPU usage 
	**/
	static var fpsLimit : Int;
	static function getCurrentLoop():() -> Void;
	static function setLoop(f:() -> Void):Void;
	static function start(callb:() -> Void):Void;
	static function setNativeCursor(c:hxd.Cursor):Void;
	static function getDeviceName():String;
	static function getDefaultFrameRate():Float;
	static function getValue(s:hxd.System.SystemValue):Bool;
	static function exit():Void;
	static function openURL(url:String):Void;
	static function getClipboardText():String;
	static function setClipboardText(text:String):Bool;
	static function getLocale():String;
	private static function get_width():Int;
	private static function get_height():Int;
	private static function get_lang():String;
	private static function get_platform():hxd.System.Platform;
	private static function get_screenDPI():Int;
	private static function get_allowTimeout():Bool;
	private static function set_allowTimeout(b:Bool):Bool;
}
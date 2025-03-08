package hxd;

typedef PadConfig = {
	var A : Int;
	var B : Int;
	var LB : Int;
	var LT : Int;
	var RB : Int;
	var RT : Int;
	var X : Int;
	var Y : Int;
	var analogClick : Int;
	var analogX : Int;
	var analogY : Int;
	var back : Int;
	var dpadDown : Int;
	var dpadLeft : Int;
	var dpadRight : Int;
	var dpadUp : Int;
	var names : Array<String>;
	var ranalogClick : Int;
	var ranalogX : Int;
	var ranalogY : Int;
	var start : Int;
};

@:native("hxd.Pad") extern class Pad {
	var connected(default, null) : Bool;
	var name(get, never) : String;
	var index : Int;
	var config : hxd.Pad.PadConfig;
	var xAxis(get, never) : Float;
	var yAxis(get, never) : Float;
	var rxAxis(get, never) : Float;
	var ryAxis(get, never) : Float;
	var axisDeadZone : Float;
	var buttons : Array<Bool>;
	var values : Array<Float>;
	var prevValues : Array<Float>;
	private function get_xAxis():Float;
	private function get_yAxis():Float;
	private function get_rxAxis():Float;
	private function get_ryAxis():Float;
	function onDisconnect():Void;
	function isDown(button:Int):Bool;
	function isPressed(button:Int):Bool;
	function isReleased(button:Int):Bool;
	function reset():Void;
	function rumble(strength:Float, time_s:Float):Void;
	private function get_name():String;
	/**
		
			 	Standard mapping
			
	**/
	static var CONFIG_JS_STD : { var A : Int; var B : Int; var LB : Int; var LT : Int; var RB : Int; var RT : Int; var X : Int; var Y : Int; var analogClick : Int; var analogX : Int; var analogY : Int; var back : Int; var dpadDown : Int; var dpadLeft : Int; var dpadRight : Int; var dpadUp : Int; var names : Array<String>; var ranalogClick : Int; var ranalogX : Int; var ranalogY : Int; var start : Int; };
	/**
		
			  	Mapping for Dualshock 4
			
	**/
	static var CONFIG_JS_DS4 : { var A : Int; var B : Int; var LB : Int; var LT : Int; var RB : Int; var RT : Int; var X : Int; var Y : Int; var analogClick : Int; var analogX : Int; var analogY : Int; var back : Int; var dpadDown : Int; var dpadLeft : Int; var dpadRight : Int; var dpadUp : Int; var names : Array<String>; var ranalogClick : Int; var ranalogX : Int; var ranalogY : Int; var start : Int; };
	/**
		
			  	Mapping for Dualshock 4 (Firefox)
		
				D-Pad isn't working
			
	**/
	static var CONFIG_JS_DS4_FF : { var A : Int; var B : Int; var LB : Int; var LT : Int; var RB : Int; var RT : Int; var X : Int; var Y : Int; var analogClick : Int; var analogX : Int; var analogY : Int; var back : Int; var dpadDown : Int; var dpadLeft : Int; var dpadRight : Int; var dpadUp : Int; var names : Array<String>; var ranalogClick : Int; var ranalogX : Int; var ranalogY : Int; var start : Int; };
	static function pickConfig(name:String):hxd.Pad.PadConfig;
	static var DEFAULT_CONFIG : hxd.Pad.PadConfig;
	/**
		
				Creates a new dummy unconnected game pad, which can be used instead of checking for null everytime. Use wait() to get real physical game pad access.
			
	**/
	static function createDummy():hxd.Pad;
	/**
		
				Wait until a gamepad gets connected. On some platforms, this might require the user to press a button until it activates
			
	**/
	static function wait(onPad:hxd.Pad -> Void):Void;
}
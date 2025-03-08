package hxd;

@:native("hxd.Key") extern class Key {
	static var BACKSPACE(default, never) : Int;
	static var TAB(default, never) : Int;
	static var ENTER(default, never) : Int;
	static var SHIFT(default, never) : Int;
	static var CTRL(default, never) : Int;
	static var ALT(default, never) : Int;
	static var ESCAPE(default, never) : Int;
	static var SPACE(default, never) : Int;
	static var PGUP(default, never) : Int;
	static var PGDOWN(default, never) : Int;
	static var END(default, never) : Int;
	static var HOME(default, never) : Int;
	static var LEFT(default, never) : Int;
	static var UP(default, never) : Int;
	static var RIGHT(default, never) : Int;
	static var DOWN(default, never) : Int;
	static var INSERT(default, never) : Int;
	static var DELETE(default, never) : Int;
	static var QWERTY_EQUALS(default, never) : Int;
	static var QWERTY_MINUS(default, never) : Int;
	static var QWERTY_TILDE(default, never) : Int;
	static var QWERTY_BRACKET_LEFT(default, never) : Int;
	static var QWERTY_BRACKET_RIGHT(default, never) : Int;
	static var QWERTY_SEMICOLON(default, never) : Int;
	static var QWERTY_QUOTE(default, never) : Int;
	static var QWERTY_BACKSLASH(default, never) : Int;
	static var QWERTY_COMMA(default, never) : Int;
	static var QWERTY_PERIOD(default, never) : Int;
	static var QWERTY_SLASH(default, never) : Int;
	static var INTL_BACKSLASH(default, never) : Int;
	static var LEFT_WINDOW_KEY(default, never) : Int;
	static var RIGHT_WINDOW_KEY(default, never) : Int;
	static var CONTEXT_MENU(default, never) : Int;
	static var PAUSE_BREAK(default, never) : Int;
	static var CAPS_LOCK(default, never) : Int;
	static var NUM_LOCK(default, never) : Int;
	static var SCROLL_LOCK(default, never) : Int;
	static var NUMBER_0(default, never) : Int;
	static var NUMBER_1(default, never) : Int;
	static var NUMBER_2(default, never) : Int;
	static var NUMBER_3(default, never) : Int;
	static var NUMBER_4(default, never) : Int;
	static var NUMBER_5(default, never) : Int;
	static var NUMBER_6(default, never) : Int;
	static var NUMBER_7(default, never) : Int;
	static var NUMBER_8(default, never) : Int;
	static var NUMBER_9(default, never) : Int;
	static var NUMPAD_0(default, never) : Int;
	static var NUMPAD_1(default, never) : Int;
	static var NUMPAD_2(default, never) : Int;
	static var NUMPAD_3(default, never) : Int;
	static var NUMPAD_4(default, never) : Int;
	static var NUMPAD_5(default, never) : Int;
	static var NUMPAD_6(default, never) : Int;
	static var NUMPAD_7(default, never) : Int;
	static var NUMPAD_8(default, never) : Int;
	static var NUMPAD_9(default, never) : Int;
	static var A(default, never) : Int;
	static var B(default, never) : Int;
	static var C(default, never) : Int;
	static var D(default, never) : Int;
	static var E(default, never) : Int;
	static var F(default, never) : Int;
	static var G(default, never) : Int;
	static var H(default, never) : Int;
	static var I(default, never) : Int;
	static var J(default, never) : Int;
	static var K(default, never) : Int;
	static var L(default, never) : Int;
	static var M(default, never) : Int;
	static var N(default, never) : Int;
	static var O(default, never) : Int;
	static var P(default, never) : Int;
	static var Q(default, never) : Int;
	static var R(default, never) : Int;
	static var S(default, never) : Int;
	static var T(default, never) : Int;
	static var U(default, never) : Int;
	static var V(default, never) : Int;
	static var W(default, never) : Int;
	static var X(default, never) : Int;
	static var Y(default, never) : Int;
	static var Z(default, never) : Int;
	static var F1(default, never) : Int;
	static var F2(default, never) : Int;
	static var F3(default, never) : Int;
	static var F4(default, never) : Int;
	static var F5(default, never) : Int;
	static var F6(default, never) : Int;
	static var F7(default, never) : Int;
	static var F8(default, never) : Int;
	static var F9(default, never) : Int;
	static var F10(default, never) : Int;
	static var F11(default, never) : Int;
	static var F12(default, never) : Int;
	static var F13(default, never) : Int;
	static var F14(default, never) : Int;
	static var F15(default, never) : Int;
	static var F16(default, never) : Int;
	static var F17(default, never) : Int;
	static var F18(default, never) : Int;
	static var F19(default, never) : Int;
	static var F20(default, never) : Int;
	static var F21(default, never) : Int;
	static var F22(default, never) : Int;
	static var F23(default, never) : Int;
	static var F24(default, never) : Int;
	static var NUMPAD_MULT(default, never) : Int;
	static var NUMPAD_ADD(default, never) : Int;
	static var NUMPAD_ENTER(default, never) : Int;
	static var NUMPAD_SUB(default, never) : Int;
	static var NUMPAD_DOT(default, never) : Int;
	static var NUMPAD_DIV(default, never) : Int;
	static var MOUSE_LEFT(default, never) : Int;
	static var MOUSE_RIGHT(default, never) : Int;
	static var MOUSE_MIDDLE(default, never) : Int;
	static var MOUSE_BACK(default, never) : Int;
	static var MOUSE_FORWARD(default, never) : Int;
	/**
		
			 * Mouse wheel does not have an off signal, and should be checked only through `isPressed` method.
			 * Note that there may be multiple wheel scrolls between 2 frames, and to receive more accurate
			 * results, it is recommended to directly listen to wheel events which also provide OS-generated wheel delta value.
			 * See `Interactive.onWheel` for per-interactive events. For scene-based see `Scene.addEventListener`
			 * when event is `EWheel`. For global hook use `Window.addEventTarget` method.
			 
	**/
	static var MOUSE_WHEEL_UP(default, never) : Int;
	/**
		
			 * Mouse wheel does not have an off signal, and should be checked only through `isPressed` method.
			 * Note that there may be multiple wheel scrolls between 2 frames, and to receive more accurate
			 * results, it is recommended to directly listen to wheel events which also provide OS-generated wheel delta value.
			 * See `Interactive.onWheel` for per-interactive events. For scene-based see `Scene.addEventListener`
			 * when event is `EWheel`. For global hook use `Window.addEventTarget` method.
			 
	**/
	static var MOUSE_WHEEL_DOWN(default, never) : Int;
	/**
		 a bit that is set for left keys 
	**/
	static var LOC_LEFT(default, never) : Int;
	/**
		 a bit that is set for right keys 
	**/
	static var LOC_RIGHT(default, never) : Int;
	static var LSHIFT(default, never) : Int;
	static var RSHIFT(default, never) : Int;
	static var LCTRL(default, never) : Int;
	static var RCTRL(default, never) : Int;
	static var LALT(default, never) : Int;
	static var RALT(default, never) : Int;
	/**
		
				This enable the native key repeat behavior, and will
				report several times isPressed() in case a key is kept
				pressed for a long time if this is allowed by the target
				platform.
			
	**/
	static var ALLOW_KEY_REPEAT : Bool;
	static function isDown(code:Int):Bool;
	static function isPressed(code:Int):Bool;
	static function isReleased(code:Int):Bool;
	static function initialize():Void;
	static function dispose():Void;
	static function getKeyName(keyCode:Int):String;
}
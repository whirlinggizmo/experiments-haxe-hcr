package h2d;

/**
 A skinnable text input handler.
 
 Supports text selection, keyboard cursor navigation, as well as basic hotkeys: `Ctrl + Z`, `Ctrl + Y` for undo and redo and `Ctrl + A` to select all text.
 */
/**
	
		A skinnable text input handler.
	
		Supports text selection, keyboard cursor navigation, as well as basic hotkeys: `Ctrl + Z`, `Ctrl + Y` for undo and redo and `Ctrl + A` to select all text.
	
**/
@:native("h2d.TextInput") extern class TextInput extends h2d.Text {
	/**
		
				Create a new TextInput instance.
				@param font The font used to render the text.
				@param parent An optional parent `h2d.Object` instance to which TextInput adds itself if set.
			
	**/
	function new(font:h2d.Font, ?parent:h2d.Object):Void;
	/**
		
				Current position of the input cursor.
				When TextInput is not focused value is -1.
			
	**/
	var cursorIndex : Int;
	/**
		
				The Tile used to render the input cursor.
			
	**/
	var cursorTile : h2d.Tile;
	/**
		
				The Tile used to render the background for selected text.
				When rendering, this Tile is stretched horizontally to fill entire selection area.
			
	**/
	var selectionTile : h2d.Tile;
	/**
		
				The blinking interval of the cursor in seconds.
			
	**/
	var cursorBlinkTime : Float;
	/**
		
				Maximum input width.
				Contrary to `Text.maxWidth` does not cause a word-wrap, but also masks out contents that are outside the max width.
			
	**/
	var inputWidth : Int;
	/**
		
				Whether the text input allows multiple lines.
			
	**/
	var multiline : Bool;
	/**
		
				If not null, represents current text selection range.
			
	**/
	var selectionRange : { var length : Int; var start : Int; };
	/**
		
				When disabled, user would not be able to edit the input text (selection is still available).
			
	**/
	var canEdit : Bool;
	/**
		
				If set, TextInput will render provided color as a background to text interactive area.
			
	**/
	var backgroundColor(get, set) : Int;
	/**
		
				When disabled, showSoftwareKeyboard will not be called.
			
	**/
	var useSoftwareKeyboard : Bool;
	/**
		
				Returns a String representing currently selected text area or `null` if no text is selected.
			
	**/
	function getSelectedText():String;
	/**
		
				Sets focus on this `TextInput`.
			
	**/
	function focus():Void;
	/**
		
				Checks if TextInput is currently focused.
			
	**/
	function hasFocus():Bool;
	/**
		
				Delegate of underlying `Interactive.onOut`.
			
	**/
	function onOut(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onOver`.
			
	**/
	function onOver(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onMove`.
			
	**/
	function onMove(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onClick`.
			
	**/
	function onClick(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onPush`.
			
	**/
	function onPush(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onRelease`.
			
	**/
	function onRelease(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onKeyDown`.
			
	**/
	function onKeyDown(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onKeyUp`.
			
	**/
	function onKeyUp(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onTextInput`.
			
	**/
	function onTextInput(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onFocus`.
			
	**/
	function onFocus(e:hxd.Event):Void;
	/**
		
				Delegate of underlying `Interactive.onFocusLost`.
			
	**/
	function onFocusLost(e:hxd.Event):Void;
	/**
		
				Sent when user modifies TextInput contents.
			
	**/
	function onChange():Void;
	private function get_backgroundColor():Int;
	private function set_backgroundColor(v:Int):Int;
	static function showSoftwareKeyboard(target:h2d.TextInput):Void;
	static function hideSoftwareKeyboard(target:h2d.TextInput):Void;
}
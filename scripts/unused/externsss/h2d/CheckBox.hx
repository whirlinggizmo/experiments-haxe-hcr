package h2d;

/**
 A simple Interactive checkbox button with a label.
 
 Useful for fast construction of development UI, but lacks on configurability side.
 */
/**
	
		A simple Interactive checkbox button with a label.
	
		Useful for fast construction of development UI, but lacks on configurability side.
	
**/
@:native("h2d.CheckBox") extern class CheckBox extends h2d.Flow {
	/**
		
				Create a new CheckBox instance.
				@param parent An optional parent `h2d.Object` instance to which CheckBox adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				When disabled, the user would not be able to change the checkbox state by interacting with it.
		
				It is still possible to change the `selected` state manually through the code even if checkbox is disabled.
			
	**/
	var enable(default, set) : Bool;
	/**
		
				Current toggle state of the checkbox.
		
				Note that changing the state from the code will cause `CheckBox.onChange` to trigger.
			
	**/
	var selected(default, set) : Bool;
	/**
		
				Optional text label that will be shown to the right of the checkbox.
			
	**/
	var text(default, set) : String;
	private function set_text(str:String):String;
	private function set_enable(b:Bool):Bool;
	private function set_selected(s:Bool):Bool;
	/**
		
				Sent when the `CheckBox.selected` state is changed.
				Can be triggered both by user interaction (when checkbox is enabled) and from the software side by changing `selected` directly.
			
	**/
	function onChange():Void;
}
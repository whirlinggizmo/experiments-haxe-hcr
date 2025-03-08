package h2d;

/**
 A simple UI component that creates an interactive drop-down list.
 
 Dropdown will add an `h2d.Flow` to the `Scene` when opening in order to be visible above other objects. See `Dropdown.dropdownLayer` for more details.
 
 There is no handling of user input on items, and implementation of selection and other actions is up to the user.
 
 Note that when `dropdownList` opens and closes, item objects will receive the `onHierarchyChanged` callback.
 */
/**
	
		A simple UI component that creates an interactive drop-down list.
	
		Dropdown will add an `h2d.Flow` to the `Scene` when opening in order to be visible above other objects. See `Dropdown.dropdownLayer` for more details.
	
		There is no handling of user input on items, and implementation of selection and other actions is up to the user.
	
		Note that when `dropdownList` opens and closes, item objects will receive the `onHierarchyChanged` callback.
	
**/
@:uiNoComponent @:native("h2d.Dropdown") extern class Dropdown extends h2d.Flow {
	/**
		
				Create a new Dropdown with given parent.
				@param parent An optional parent `h2d.Object` instance to which Dropdown adds itself if set.
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				A background Tile that is shown when user hover over an item in the dropdown list.
		
				The tile will be stretched to cover full row width and item height during rendering.
			
	**/
	var tileOverItem(default, set) : h2d.Tile;
	/**
		
				A Tile used to visualize an arrow of the dropdown when the list is closed.
			
	**/
	var tileArrow(default, set) : h2d.Tile;
	/**
		
				A Tile used to visualize and arrow of the dropdown when the list is open.
			
	**/
	var tileArrowOpen : h2d.Tile;
	/**
		
				When disabled, the user would not be able to change the selected item.
			
	**/
	var canEdit(default, set) : Bool;
	/**
		
				A reference to the Flow that will contain the items.
			
	**/
	var dropdownList : h2d.Flow;
	/**
		
				A Scene layer to which `dropdownList` will be added when opening dropdown.
			
	**/
	var dropdownLayer : Int;
	/**
		
				Currently selected item index. To deselect an item, set it to `-1`.
			
	**/
	var selectedItem(default, set) : Int;
	/**
		
				Currently highlighted item index.
			
	**/
	var highlightedItem(default, null) : Int;
	/**
		
				When enabled, the dropdown list will appear above the dropdown.
			
	**/
	var rollUp : Bool;
	private function set_tileArrow(t:h2d.Tile):h2d.Tile;
	private function set_tileOverItem(t:h2d.Tile):h2d.Tile;
	/**
		
				Adds the Object `s` to the dropdown list. `s` is not restricted to be the same type across all items.
			
	**/
	function addItem(s:h2d.Object):Void;
	private function set_canEdit(b:Bool):Bool;
	private function set_selectedItem(s:Int):Int;
	/**
		
				Programmatically opens the dropdown, showing the dropdown list.
			
	**/
	function open():Void;
	/**
		
				Programmatically closes the dropdown, hiding the dropdown list.
			
	**/
	function close():Void;
	/**
		
				Sent when dropdown is being opened. Triggered both by user input and programmatic action via `Dropdown.open`.
			
	**/
	function onOpen():Void;
	/**
		
				Sent when dropdown is being closed. Triggered both by user input and programmatic action via `Dropdown.close`.
			
	**/
	function onClose():Void;
	/**
		
				Sent when user change the item in the list.
				@param item An object that was hovered.
			
	**/
	function onChange(item:h2d.Object):Void;
	/**
		
				Sent when user hovers over an item in the dropdown list.
				@param item An object that was hovered.
			
	**/
	function onOverItem(item:h2d.Object):Void;
	/**
		
				Sent when user moves mouse away from an item in the dropdown list.
				@param item An item that was hovered previously.
			
	**/
	function onOutItem(item:h2d.Object):Void;
}
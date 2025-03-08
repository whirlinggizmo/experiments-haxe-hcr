package h2d.filter;

@:dox(hide) @:native("h2d.filter.AbstractMask") extern class Hide extends h2d.filter.Filter {
	function new():Void;
	var frame : Int;
	var input : h2d.Tile;
	var maskVisible : Bool;
	var inputWidth : Int;
	var inputHeight : Int;
	override function draw(ctx:h2d.RenderContext, input:h2d.Tile):h2d.Tile;
}

/**
 A base class for filters that utilize separate Objects as a masking object.
 
 Not intended to be used directly.
 
 Masking objects have a number of restrictions on them, see `AbstractMask.mask` for details.
 */
/**
	
		A base class for filters that utilize separate Objects as a masking object.
	
		Not intended to be used directly.
	
		Masking objects have a number of restrictions on them, see `AbstractMask.mask` for details.
	
**/
@:native("h2d.filter.AbstractMask") extern class AbstractMask extends h2d.filter.Filter {
	/**
		
				The Object contents of which serve as a mask to the filtered Object.
		
				Masking Objects have following limitations:
				* It cannot be a parent of the filtered Object.
				* It should not contain any filters.
				* It should be present in the object tree and precede the Object it masks in the rendering order (rendered before it).
				* Same masking Object cannot be used by multiple mask filters.
			
	**/
	var mask(default, set) : h2d.Object;
	/**
		
				When enabled, masking Object will be visible to the user. Hidden otherwise. ( default : false )
			
	**/
	var maskVisible(default, set) : Bool;
	private function set_maskVisible(b:Bool):Bool;
	override function bind(s:h2d.Object):Void;
	override function unbind(s:h2d.Object):Void;
	private function set_mask(m:h2d.Object):h2d.Object;
	override function sync(ctx:h2d.RenderContext, obj:h2d.Object):Void;
}
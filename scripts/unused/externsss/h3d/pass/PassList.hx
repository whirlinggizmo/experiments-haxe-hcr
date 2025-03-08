package h3d.pass;

@:native("h3d.pass.PassList") extern class PassListIterator {

}

@:access(h3d.pass.PassObject) @:native("h3d.pass.PassList") extern class PassList {
	function new(?current:h3d.pass.PassObject):Void;
	/**
		
				Put all passes into discarded list
			
	**/
	function clear():Void;
}
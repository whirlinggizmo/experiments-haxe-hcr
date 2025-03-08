package hxd.poly2tri;

@:native("hxd.poly2tri.Basin") extern class Basin {
	function new():Void;
	var left_node : hxd.poly2tri.Node;
	var bottom_node : hxd.poly2tri.Node;
	var right_node : hxd.poly2tri.Node;
	var width : Float;
	var left_highest : Bool;
	function clear():Void;
}
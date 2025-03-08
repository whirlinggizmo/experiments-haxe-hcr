package hxd.poly2tri;

@:native("hxd.poly2tri.EdgeEvent") extern class EdgeEvent {
	function new():Void;
	var constrained_edge : hxd.poly2tri.Edge;
	var right : Bool;
}
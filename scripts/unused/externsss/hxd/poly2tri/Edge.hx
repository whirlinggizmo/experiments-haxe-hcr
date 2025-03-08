package hxd.poly2tri;

@:native("hxd.poly2tri.Edge") extern class Edge {
	function new(p1:hxd.poly2tri.Point, p2:hxd.poly2tri.Point):Void;
	var p : hxd.poly2tri.Point;
	var q : hxd.poly2tri.Point;
	function toString():String;
}
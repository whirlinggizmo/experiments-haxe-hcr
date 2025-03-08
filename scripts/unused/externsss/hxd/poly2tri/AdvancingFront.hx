package hxd.poly2tri;

@:native("hxd.poly2tri.AdvancingFront") extern class AdvancingFront {
	function new(head:hxd.poly2tri.Node, tail:hxd.poly2tri.Node):Void;
	var head : hxd.poly2tri.Node;
	var tail : hxd.poly2tri.Node;
	var search_node : hxd.poly2tri.Node;
	function locateNode(x:hxd.poly2tri.Constants.Unit):hxd.poly2tri.Node;
	function locatePoint(point:hxd.poly2tri.Point):hxd.poly2tri.Node;
}
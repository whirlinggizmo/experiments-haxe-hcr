package hxd.poly2tri;

@:native("hxd.poly2tri.SweepContext") extern class SweepContext {
	function new():Void;
	var triangles : Array<hxd.poly2tri.Triangle>;
	var points : Array<hxd.poly2tri.Point>;
	var edge_list : Array<hxd.poly2tri.Edge>;
	var front : hxd.poly2tri.AdvancingFront;
	var head : hxd.poly2tri.Point;
	var tail : hxd.poly2tri.Point;
	var basin : hxd.poly2tri.Basin;
	var edge_event : hxd.poly2tri.EdgeEvent;
	function addPolyline(polyline:Array<hxd.poly2tri.Point>):Void;
	function addToMap(triangle:hxd.poly2tri.Triangle):Void;
	function initTriangulation():Void;
	function locateNode(point:hxd.poly2tri.Point):hxd.poly2tri.Node;
	function createAdvancingFront():Void;
	function removeNode(node:hxd.poly2tri.Node):Void;
	function mapTriangleToNodes(triangle:hxd.poly2tri.Triangle):Void;
	function meshClean(t:hxd.poly2tri.Triangle):Void;
}
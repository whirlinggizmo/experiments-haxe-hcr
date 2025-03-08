package hxd.poly2tri;

@:native("hxd.poly2tri.VisiblePolygon") extern class VisiblePolygon {
	function new():Void;
	function addPolyline(polyline:Array<hxd.poly2tri.Point>):Void;
	function reset():Void;
	function performTriangulationOnce():Void;
	function getVerticesAndTriangles():{ public var vertices(default, default) : Array<Float>; public var triangles(default, default) : Array<Int>; };
	function getNumTriangles():Int;
}
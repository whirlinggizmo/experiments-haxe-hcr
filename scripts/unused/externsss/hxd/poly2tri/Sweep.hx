package hxd.poly2tri;

@:native("hxd.poly2tri.Sweep") extern class Sweep {
	function new(context:hxd.poly2tri.SweepContext):Void;
	function triangulate():Void;
	function sweepPoints():Void;
	function finalizationPolygon():Void;
	/**
		
			 * Find closes node to the left of the new point and
			 * create a new triangle. If needed new holes and basins
			 * will be filled to.
			 
	**/
	function pointEvent(point:hxd.poly2tri.Point):hxd.poly2tri.Node;
	function edgeEventByEdge(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function edgeEventByPoints(ep:hxd.poly2tri.Point, eq:hxd.poly2tri.Point, triangle:hxd.poly2tri.Triangle, point:hxd.poly2tri.Point):Void;
	function newFrontTriangle(point:hxd.poly2tri.Point, node:hxd.poly2tri.Node):hxd.poly2tri.Node;
	/**
		
			 * Adds a triangle to the advancing front to fill a hole.
			 * @param tcx
			 * @param node - middle node, that is the bottom of the hole
			 
	**/
	function fill(node:hxd.poly2tri.Node):Void;
	/**
		
			 * Fills holes in the Advancing Front
			 
	**/
	function fillAdvancingFront(n:hxd.poly2tri.Node):Void;
	/**
		
			 * Returns true if triangle was legalized
			 
	**/
	function legalize(t:hxd.poly2tri.Triangle):Bool;
	/**
		
			 * Fills a basin that has formed on the Advancing Front to the right
			 * of given node.<br>
			 * First we decide a left,bottom and right node that forms the
			 * boundaries of the basin. Then we do a reqursive fill.
			 *
			 * @param tcx
			 * @param node - starting node, this or next node will be left node
			 
	**/
	function fillBasin(node:hxd.poly2tri.Node):Void;
	/**
		
			 * Recursive algorithm to fill a Basin with triangles
			 *
			 * @param tcx
			 * @param node - bottom_node
			 
	**/
	function fillBasinReq(node:hxd.poly2tri.Node):Void;
	function fillEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillRightAboveEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillRightBelowEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillRightConcaveEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillRightConvexEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillLeftAboveEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillLeftBelowEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillLeftConvexEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function fillLeftConcaveEdgeEvent(edge:hxd.poly2tri.Edge, node:hxd.poly2tri.Node):Void;
	function flipEdgeEvent(ep:hxd.poly2tri.Point, eq:hxd.poly2tri.Point, t:hxd.poly2tri.Triangle, p:hxd.poly2tri.Point):Void;
	function nextFlipTriangle(o:Int, t:hxd.poly2tri.Triangle, ot:hxd.poly2tri.Triangle, p:hxd.poly2tri.Point, op:hxd.poly2tri.Point):hxd.poly2tri.Triangle;
	function flipScanEdgeEvent(ep:hxd.poly2tri.Point, eq:hxd.poly2tri.Point, flip_triangle:hxd.poly2tri.Triangle, t:hxd.poly2tri.Triangle, p:hxd.poly2tri.Point):Void;
	static function nextFlipPoint(ep:hxd.poly2tri.Point, eq:hxd.poly2tri.Point, ot:hxd.poly2tri.Triangle, op:hxd.poly2tri.Point):hxd.poly2tri.Point;
}
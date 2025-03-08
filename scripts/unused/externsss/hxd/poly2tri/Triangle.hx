package hxd.poly2tri;

@:native("hxd.poly2tri.Triangle") extern class Triangle {
	function new(p1:hxd.poly2tri.Point, p2:hxd.poly2tri.Point, p3:hxd.poly2tri.Point, ?fixOrientation:Bool, ?checkOrientation:Bool):Void;
	var points : Array<hxd.poly2tri.Point>;
	var neighbors : Array<hxd.poly2tri.Triangle>;
	var id : Int;
	var constrained_edge : Array<Bool>;
	var delaunay_edge : Array<Bool>;
	/**
		
			 * Test if this Triangle contains the Point object given as parameter as its vertices.
			 *
			 * @return <code>True</code> if the Point objects are of the Triangle's vertices,
			 *         <code>false</code> otherwise.
			 
	**/
	function containsPoint(point:hxd.poly2tri.Point):Bool;
	function containsEdgePoints(p1:hxd.poly2tri.Point, p2:hxd.poly2tri.Point):Bool;
	/**
		
			 * Update neighbor pointers.<br>
			 * This method takes either 3 parameters (<code>p1</code>, <code>p2</code> and
			 * <code>t</code>) or 1 parameter (<code>t</code>).
			 * @param   t   Triangle object.
			 * @param   p1  Point object.
			 * @param   p2  Point object.
			 
	**/
	function markNeighbor(t:hxd.poly2tri.Triangle, p1:hxd.poly2tri.Point, p2:hxd.poly2tri.Point):Void;
	function markNeighborTriangle(that:hxd.poly2tri.Triangle):Void;
	function getPointIndexOffset(p:hxd.poly2tri.Point, ?offset:Int):Int;
	/**
		
			 * Legalize triangle by rotating clockwise.<br>
			 * This method takes either 1 parameter (then the triangle is rotated around
			 * points(0)) or 2 parameters (then the triangle is rotated around the first
			 * parameter).
			 
	**/
	function legalize(opoint:hxd.poly2tri.Point, ?npoint:hxd.poly2tri.Point):Void;
	function edgeIndex(p1:hxd.poly2tri.Point, p2:hxd.poly2tri.Point):Int;
	function markConstrainedEdgeByPoints(p:hxd.poly2tri.Point, q:hxd.poly2tri.Point):Void;
	/**
		
			 * Checks if a side from this triangle is an edge side.
			 * If sides are not marked they will be marked.
			 *
			 * @param	ep
			 * @param	eq
			 * @return
			 
	**/
	function isEdgeSide(ep:hxd.poly2tri.Point, eq:hxd.poly2tri.Point):Bool;
	function clearNeigbors():Void;
	function clearDelunayEdges():Void;
	function toString():String;
	/**
		
			 * Rotates a triangle pair one vertex CW
			 *<pre>
			 *       n2                    n2
			 *  P +-----+             P +-----+
			 *    | t  /|               |\  t |
			 *    |   / |               | \   |
			 *  n1|  /  |n3           n1|  \  |n3
			 *    | /   |    after CW   |   \ |
			 *    |/ oT |               | oT \|
			 *    +-----+ oP            +-----+
			 *       n4                    n4
			 * </pre>
			 
	**/
	static function rotateTrianglePair(t:hxd.poly2tri.Triangle, p:hxd.poly2tri.Point, ot:hxd.poly2tri.Triangle, op:hxd.poly2tri.Point):Void;
}
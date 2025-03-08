package hxd.poly2tri;

@:native("hxd.poly2tri.Node") extern class Node {
	function new(?point:hxd.poly2tri.Point, ?triangle:hxd.poly2tri.Triangle):Void;
	var point : hxd.poly2tri.Point;
	var triangle : hxd.poly2tri.Triangle;
	var prev : hxd.poly2tri.Node;
	var next : hxd.poly2tri.Node;
	var value : Float;
	/**
		
			 *
			 * @param node - middle node
			 * @return the angle between 3 front nodes
			 
	**/
	function getHoleAngle():Float;
	function getBasinAngle():Float;
}
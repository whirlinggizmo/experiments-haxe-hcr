package hxd.poly2tri;

@:native("hxd.poly2tri.Point") extern class Point {
	function new(x:Float, y:Float):Void;
	var id : Int;
	var x : Float;
	var y : Float;
	var edge_list(get, null) : Array<hxd.poly2tri.Edge>;
	private function get_edge_list():Array<hxd.poly2tri.Edge>;
	function toString():String;
	static function sortPoints(points:Array<hxd.poly2tri.Point>):Void;
	static function cmpPoints(l:hxd.poly2tri.Point, r:hxd.poly2tri.Point):Int;
	static var C_ID : Int;
}
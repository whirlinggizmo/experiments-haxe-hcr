package hxd.poly2tri;

@:native("hxd.poly2tri.Orientation") extern class Orientation {
	static var CW(default, never) : Int;
	static var CCW(default, never) : Int;
	static var COLLINEAR(default, never) : Int;
	static function orient2d(pa:hxd.poly2tri.Point, pb:hxd.poly2tri.Point, pc:hxd.poly2tri.Point):Int;
}
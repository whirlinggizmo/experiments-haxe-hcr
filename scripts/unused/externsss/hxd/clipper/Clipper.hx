package hxd.clipper;

@:native("hxd.clipper.Clipper") extern enum NodeType {
	Any;
	Open;
	Closed;
}

@:native("hxd.clipper.Clipper") extern enum ResultKind {
	All;
	NoHoles;
	HolesOnly;
}

@:noDebug @:allow(hxd.clipper) @:native("hxd.clipper.Clipper") extern class Clipper extends hxd.clipper._Clipper.Clipper.ClipperBase {
	function new():Void;
	var strictlySimple : Bool;
	var reverseSolution : Bool;
	var resultKind : hxd.clipper.Clipper.ResultKind;
	function execute(clipType:hxd.clipper.ClipType, ?subjFillType:hxd.clipper.PolyFillType, ?clipFillType:hxd.clipper.PolyFillType):Array<h2d.col.IPolygon>;
	function ExecuteTree(clipType:hxd.clipper.ClipType, polytree:PolyTree, ?subjFillType:hxd.clipper.PolyFillType, ?clipFillType:hxd.clipper.PolyFillType):Bool;
	function PointInPolygon(pt:h2d.col.IPoint, pol:h2d.col.IPolygon):Int;
	function CleanPolygon(path:h2d.col.IPolygon, ?distance:Float):h2d.col.IPolygon;
	function CleanPolygons(polys:h2d.col.IPolygons, ?distance:Float):h2d.col.IPolygons;
	function MinkowskiSum(pattern:h2d.col.IPolygon, pol:h2d.col.IPolygon, ?kind:hxd.clipper.Clipper.ResultKind):Array<h2d.col.IPolygon>;
	function PolyTreeToPaths(polytree:PolyTree):h2d.col.IPolygons;
	static function polArea(poly:h2d.col.IPolygon):Float;
	static function SimplifyPolygon(poly:h2d.col.IPolygon, ?fillType:hxd.clipper.PolyFillType):Array<h2d.col.IPolygon>;
	static function SimplifyPolygons(polys:h2d.col.IPolygons, ?fillType:hxd.clipper.PolyFillType):Array<h2d.col.IPolygon>;
	static function MinkowskiSums(pattern:h2d.col.IPolygon, pols:h2d.col.IPolygons, ?kind:hxd.clipper.Clipper.ResultKind):Array<h2d.col.IPolygon>;
	static function MinkowskiDiff(pattern:h2d.col.IPolygon, pol:h2d.col.IPolygon, ?kind:hxd.clipper.Clipper.ResultKind):Array<h2d.col.IPolygon>;
}

@:allow(hxd.clipper) @:native("hxd.clipper.Clipper") extern class ClipperOffset {
	function new(?miterLimit:Float, ?arcTolerance:Float):Void;
	var ArcTolerance : Float;
	var MiterLimit : Float;
	var resultKind : hxd.clipper.Clipper.ResultKind;
	function clear():Void;
	function addPolygon(pol:h2d.col.IPolygon, joinType:hxd.clipper.JoinType, endType:hxd.clipper.EndType):Void;
	function addPolygons(pols:h2d.col.IPolygons, joinType:hxd.clipper.JoinType, endType:hxd.clipper.EndType):Void;
	function execute(delta:Float):Array<h2d.col.IPolygon>;
}
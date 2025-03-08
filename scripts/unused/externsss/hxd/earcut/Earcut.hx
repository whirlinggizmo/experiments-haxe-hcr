package hxd.earcut;

@:native("hxd.earcut.Earcut") extern class EarNode {
	function new():Void;
	var next : hxd.earcut.Earcut.EarNode;
	var prev : hxd.earcut.Earcut.EarNode;
	var nextZ : hxd.earcut.Earcut.EarNode;
	var prevZ : hxd.earcut.Earcut.EarNode;
	var allocNext : hxd.earcut.Earcut.EarNode;
	var x : Float;
	var y : Float;
	var i : Int;
	var z : Int;
	var steiner : Bool;
}

/**
 Ported from https://github.com/mapbox/earcut by @ncannasse
 */
/**
	
		Ported from https://github.com/mapbox/earcut by @ncannasse
	
**/
@:native("hxd.earcut.Earcut") extern class Earcut {
	function new():Void;
	@:noCompletion
	@:noUsing
	@:genericInstance
	@:generic
	function triangulate_h2d_GPoint(points:Array<h2d.Graphics.GPoint>, ?holes:Array<Int>):Array<Int>;
	@:noCompletion
	@:noUsing
	@:genericInstance
	@:generic
	function triangulate_anon_y_Float_x_Float(points:Array<{ public var y(default, default) : Float; public var x(default, default) : Float; }>, ?holes:Array<Int>):Array<Int>;
	@:generic
	function triangulate<T:({ var x : Float; var y : Float; })>(points:Array<T>, ?holes:Array<Int>):Array<Int>;
	function triangulateNode(root:hxd.earcut.Earcut.EarNode, useZOrder:Bool):Array<Int>;
}
package hxd.clipper;

@:native("hxd.clipper.Rect") extern class Rect {
	function new(?l:Int, ?t:Int, ?r:Int, ?b:Int):Void;
	var left : Int;
	var top : Int;
	var right : Int;
	var bottom : Int;
}
package h3d.impl;

@:native("h3d.impl.Benchmark") extern class Benchmark extends h2d.Graphics {
	function new(?parent:h2d.Object):Void;
	var estimateWait : Bool;
	var enable(default, set) : Bool;
	var width : Int;
	var height : Int;
	var textColor : Int;
	var colors : Array<Int>;
	var font : h2d.Font;
	var recalTime : Float;
	var smoothTime : Float;
	var measureCpu : Bool;
	var displayTriangleCount : Bool;
	private function set_enable(e:Bool):Bool;
	override function clear():Void;
	function begin(?withVisual:Bool):Void;
	function syncVisual():Void;
	function end():Void;
	function measure(name:String):Void;
	function getCurrentId():String;
	static function takeControl(app:hxd.App, ?s3d:h3d.scene.Scene):Void;
}
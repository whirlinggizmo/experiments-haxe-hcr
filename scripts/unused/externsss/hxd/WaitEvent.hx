package hxd;

@:native("hxd.WaitEvent") extern class WaitEvent {
	function new():Void;
	function clear():Void;
	function add(callb:Float -> Bool):Void;
	function remove(callb:Float -> Bool):Bool;
	function wait(time:Float, callb:() -> Void):Void;
	function waitUntil(callb:Float -> Bool):Void;
	function update(dt:Float):Void;
}
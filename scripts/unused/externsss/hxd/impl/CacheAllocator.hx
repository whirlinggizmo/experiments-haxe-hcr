package hxd.impl;

@:native("hxd.impl.CacheAllocator") extern class CacheAllocator extends hxd.impl.Allocator {
	function new():Void;
	var currentFrame : Int;
	/**
		
			 * How long do we keep some buffer than hasn't been used in memory (in seconds, default 60)
			
	**/
	var maxKeepTime : Float;
	override function allocBuffer(vertices:Int, format:hxd.BufferFormat, ?flags:hxd.impl.Allocator.BufferFlags):h3d.Buffer;
	override function disposeBuffer(b:h3d.Buffer):Void;
	override function allocIndexBuffer(count:Int):h3d.Indexes;
	override function disposeIndexBuffer(i:h3d.Indexes):Void;
	override function onContextLost():Void;
	function checkFrame():Void;
	function checkGC():Void;
	function gc():Void;
	function clear():Void;
}
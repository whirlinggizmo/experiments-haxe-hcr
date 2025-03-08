package hxd.impl;

@:native("hxd.impl.FIFOBufferAllocator") extern class FIFOBufferAllocator extends hxd.impl.Allocator {
	function new():Void;
	var currentFrame : Int;
	/**
		
			 * How long do we keep some buffer than hasn't been used in memory (in frames)
			
	**/
	var maxKeepFrame(default, set) : Int;
	function set_maxKeepFrame(v:Int):Int;
	/**
		
			 * Maximum buffers memory in bytes.
			
	**/
	var maxMemSize : Int;
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
package hxd.impl;

@:enum typedef BufferFlags = Int;

@:native("hxd.impl.Allocator") extern class Allocator {
	function new():Void;
	function allocBuffer(vertices:Int, format:hxd.BufferFormat, ?flags:hxd.impl.Allocator.BufferFlags):h3d.Buffer;
	function ofFloats(v:hxd.FloatBuffer, format:hxd.BufferFormat, ?flags:hxd.impl.Allocator.BufferFlags):h3d.Buffer;
	function ofSubFloats(v:hxd.FloatBuffer, vertices:Int, format:hxd.BufferFormat, ?flags:hxd.impl.Allocator.BufferFlags):h3d.Buffer;
	function disposeBuffer(b:h3d.Buffer):Void;
	function allocIndexBuffer(count:Int):h3d.Indexes;
	function ofIndexes(ib:hxd.IndexBuffer, ?length:Int):h3d.Indexes;
	function disposeIndexBuffer(i:h3d.Indexes):Void;
	function onContextLost():Void;
	function allocFloats(count:Int):hxd.FloatBuffer;
	function disposeFloats(f:hxd.FloatBuffer):Void;
	function allocIndexes(count:Int):hxd.IndexBuffer;
	function disposeIndexes(i:hxd.IndexBuffer):Void;
	static function set(a:hxd.impl.Allocator):Void;
	static function get():hxd.impl.Allocator;
}
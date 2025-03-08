package h3d;

@:native("h3d.Buffer") extern enum BufferFlag {
	/**
		
				Indicate that the buffer content will be often modified.
			
	**/
	Dynamic;
	/**
		
				Used internaly
			
	**/
	NoAlloc;
	/**
		
				Used for shader input buffer
			
	**/
	UniformBuffer;
	/**
		
				Can be written
			
	**/
	ReadWriteBuffer;
	/**
		
				Used as index buffer
			
	**/
	IndexBuffer;
}

@:allow(h3d.impl.MemoryManager) @:native("h3d.Buffer") extern class Buffer {
	function new(vertices:Int, format:hxd.BufferFormat, ?flags:Array<h3d.Buffer.BufferFlag>):Void;
	var id : Int;
	var vertices(default, null) : Int;
	var format(default, null) : hxd.BufferFormat;
	var flags(default, null) : haxe.EnumFlags<h3d.Buffer.BufferFlag>;
	function dispose():Void;
	function uploadFloats(buf:hxd.FloatBuffer, bufPos:Int, vertices:Int, ?startVertice:Int):Void;
	function uploadBytes(data:haxe.io.Bytes, dataPos:Int, vertices:Int):Void;
	function readBytes(bytes:haxe.io.Bytes, bytesPosition:Int, vertices:Int, ?startVertice:Int):Void;
	static var GUID : Int;
	static function ofFloats(v:hxd.FloatBuffer, format:hxd.BufferFormat, ?flags:Array<h3d.Buffer.BufferFlag>):h3d.Buffer;
	static function ofSubFloats(v:hxd.FloatBuffer, vertices:Int, format:hxd.BufferFormat, ?flags:Array<h3d.Buffer.BufferFlag>):h3d.Buffer;
}
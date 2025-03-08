package h3d.impl;

@:allow(h3d.impl.Driver) @:native("h3d.impl.InstanceBuffer") extern class InstanceBuffer {
	function new():Void;
	var triCount(default, null) : Int;
	var commandCount(default, null) : Int;
	function setCommand(commandCount:Int, indexCount:Int, ?startIndex:Int):Void;
	/**
		
				Bytes are structures of 5 i32 with the following values:
				- indexCount : number of indexes per instance
				- instanceCount : number of indexed draws
				- startIndexLocation : offset in indexes
				- baseVertexLocation : offset in buffer
				- startInstanceLocation : offset in per instance buffer
			
	**/
	function setBuffer(commandCount:Int, bytes:haxe.io.Bytes):Void;
	function dispose():Void;
}
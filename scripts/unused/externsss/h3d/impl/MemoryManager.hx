package h3d.impl;

typedef StackStats = {
	var count : Int;
	var size : Int;
	var stack : String;
	var stats : Array<h3d.impl.MemoryManager.TextureStat>;
};

typedef AllocStats = {
	var count : Int;
	var position : String;
	var size : Int;
	var stacks : Array<h3d.impl.MemoryManager.StackStats>;
	var tex : Bool;
};

typedef TextureStat = {
	var name : String;
	var size : Int;
};

@:native("h3d.impl.MemoryManager") extern class MemoryManager {
	function new(driver:h3d.impl.Driver):Void;
	var usedMemory(default, null) : Float;
	var texMemory(default, null) : Float;
	var autoDisposeCooldown : Int;
	function init():Void;
	/**
		
				Call user-defined garbage function that will cleanup some unused allocated objects.
				Might be called several times if we need to allocate a lot of memory
			
	**/
	function garbage():Void;
	function getTriIndexes(vertices:Int):h3d.Indexes;
	function getQuadIndexes(vertices:Int):h3d.Indexes;
	function cleanTextures(?force:Bool):Bool;
	function onContextLost():Void;
	function dispose():Void;
	function stats():{ var bufferCount : Int; var bufferMemory : Float; var textureCount : Int; var textureMemory : Float; var totalMemory : Float; };
	/**
		
			 * Return statistics for currently allocated buffers and textures.
			 * Requires call `MemoryManager.enableTrackAlloc()` before allocations.
			 
	**/
	@:access(h3d.Buffer)
	function allocStats():Array<h3d.impl.MemoryManager.AllocStats>;
	static function enableTrackAlloc(?b:Bool):Void;
}
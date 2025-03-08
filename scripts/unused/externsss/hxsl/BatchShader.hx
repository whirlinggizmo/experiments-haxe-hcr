package hxsl;

@:src({
		@const var Batch_HasOffset:Bool;
		@const var Batch_UseStorage:Bool;
		@const(4096) var Batch_Count:Int;
		@param var Batch_Buffer:Buffer<Vec4, Batch_Count>;
		@param var Batch_StorageBuffer:RWBuffer<Vec4>;
	}) @:build(hxsl.Macros.buildShader()) @:autoBuild(hxsl.Macros.buildShader()) @:native("hxsl.BatchShader") extern class BatchShader extends hxsl.Shader {
	function new():Void;
	var params : hxsl.RuntimeShader.AllocParam;
	var paramsSize : Int;
	var Batch_HasOffset(get, set) : Bool;
	var Batch_UseStorage(get, set) : Bool;
	var Batch_Count(get, set) : Int;
	var Batch_Buffer(get, set) : hxsl.Types.Buffer;
	var Batch_StorageBuffer(get, set) : hxsl.Types.Buffer;
	override function updateConstants(globals:hxsl.Globals):Void;
	override function getParamValue(index:Int):Dynamic;
	override function getParamFloatValue(index:Int):Float;
	override function setParamIndexValue(index:Int, val:Dynamic):Void;
	override function setParamIndexFloatValue(index:Int, val:Float):Void;
	override function clone():hxsl.Shader;
}
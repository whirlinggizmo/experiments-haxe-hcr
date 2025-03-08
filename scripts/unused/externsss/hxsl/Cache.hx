package hxsl;

@:native("hxsl.Cache") extern class BatchInstanceParams {
	function new(forcedPerInstance:Array<{ public var shader(default, default) : String; public var params(default, default) : Array<String>; }>):Void;
	function getSignature():String;
}

@:native("hxsl.Cache") extern class SearchMap {
	function new():Void;
	var linked : hxsl.RuntimeShader;
	function set(id:Int, s:hxsl.Cache.SearchMap):Void;
}

@:native("hxsl.Cache") extern class Cache {
	/**
		
				Creates a shader that generate the output requested.
			
	**/
	function getLinkShader(vars:Array<hxsl.Output>):hxsl.Shader;
	@:noDebug
	function link(shaders:hxsl.ShaderList, mode:hxsl.RuntimeShader.LinkMode):hxsl.RuntimeShader;
	function makeBatchShader(rt:hxsl.RuntimeShader, shaders:hxsl.ShaderList, params:hxsl.Cache.BatchInstanceParams):hxsl.BatchShader;
	static function get():hxsl.Cache;
	static function set(c:hxsl.Cache):Void;
	static function clear():Void;
}
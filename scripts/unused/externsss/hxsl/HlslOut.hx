package hxsl;

@:native("hxsl.HlslOut") extern class Samplers {
	function new():Void;
	var count : Int;
	function make(v:hxsl.Ast.TVar, arr:Array<Int>):Array<Int>;
}

@:native("hxsl.HlslOut") extern class HlslOut {
	function new():Void;
	var varNames : Map<Int, String>;
	var baseRegister : Int;
	function run(s:hxsl.Ast.ShaderData):String;
	static function varName(v:hxsl.Ast.TVar, varNames:Map<Int, String>, allNames:Map<String, Int>):String;
	static function semanticName(name:String):String;
}
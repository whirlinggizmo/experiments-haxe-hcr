package hxsl;

@:build(hxsl.Macros.buildShader()) @:autoBuild(hxsl.Macros.buildShader()) @:native("hxsl.DynamicShader") extern class DynamicShader extends hxsl.Shader {
	function new(s:hxsl.SharedShader):Void;
	function getParamIndex(p:hxsl.Ast.TVar):Int;
	override function getParamValue(index:Int):Dynamic;
	override function getParamFloatValue(index:Int):Float;
	function setParamValue(p:hxsl.Ast.TVar, value:Dynamic):Void;
	function setParamFloatValue(p:hxsl.Ast.TVar, value:Float):Void;
	override function updateConstants(globals:hxsl.Globals):Void;
	function getVariable(name:String):Float;
	function setVariable(name:String, value:Dynamic):Bool;
	@:keep
	function hscriptGet(field:String):Dynamic;
	@:keep
	function hscriptSet(field:String, value:Dynamic):Dynamic;
	override function toString():String;
}
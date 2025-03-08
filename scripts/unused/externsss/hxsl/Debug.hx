package hxsl;

@:native("hxsl.Debug") extern class Debug {
	static var VAR_IDS : Bool;
	static var TRACE : Bool;
	static function trace(str:Dynamic):Dynamic;
	static function varName(v:hxsl.Ast.TVar, ?swizBits:Int):String;
	static function traceDepth(str:Dynamic):Dynamic;
}
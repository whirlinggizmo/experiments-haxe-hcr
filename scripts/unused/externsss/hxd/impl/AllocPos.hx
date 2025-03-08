package hxd.impl;

@:native("hxd.impl.AllocPos") extern class AllocPos {
	var position : String;
	var stack : Array<String>;
	static var ENGINE_PACKAGES : Array<String>;
	static function make():hxd.impl.AllocPos;
}
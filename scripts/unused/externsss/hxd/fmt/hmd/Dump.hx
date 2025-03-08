package hxd.fmt.hmd;

@:native("hxd.fmt.hmd.Dump") extern class Dump {
	function new():Void;
	function dump(h:hxd.fmt.hmd.Data):String;
	static function toString(hmd:hxd.fmt.hmd.Data):String;
}
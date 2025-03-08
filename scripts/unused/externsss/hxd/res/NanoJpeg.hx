package hxd.res;

@:native("hxd.res.NanoJpeg") extern enum Filter {
	Fast;
	Chromatic;
}

@:noDebug @:native("hxd.res.NanoJpeg") extern class NanoJpeg {
	static function decode(bytes:haxe.io.Bytes, ?filter:hxd.res.NanoJpeg.Filter, ?position:Int, ?size:Int):{ var height : Int; var pixels : haxe.io.Bytes; var width : Int; };
}
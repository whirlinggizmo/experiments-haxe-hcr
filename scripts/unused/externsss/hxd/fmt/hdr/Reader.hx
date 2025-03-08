package hxd.fmt.hdr;

@:native("hxd.fmt.hdr.Reader") extern class Reader {
	static function decode(bytes:haxe.io.Bytes, sRGB:Bool):{ var bytes : haxe.io.Bytes; var gamma : Bool; var height : Int; var width : Int; };
}
package hxd.fmt.tiff;

@:enum typedef TifTag = Int;

@:enum typedef TifType = Int;

@:native("hxd.fmt.tiff.Data") extern enum TifValue {
	VInt(v:Int);
	VFloat(v:Float);
	VString(s:String);
	VArray(a:Array<hxd.fmt.tiff.Data.TifValue>);
}

typedef TifFile = {
	var data : Array<haxe.io.Bytes>;
	var tags : Array<{ public var value(default, default) : hxd.fmt.tiff.Data.TifValue; public var type(default, default) : hxd.fmt.tiff.Data.TifType; public var tag(default, default) : hxd.fmt.tiff.Data.TifTag; }>;
};

@:native("hxd.fmt.tiff.Data") extern class Utils {
	static function get(f:hxd.fmt.tiff.Data.TifFile, tag:hxd.fmt.tiff.Data.TifTag):hxd.fmt.tiff.Data.TifValue;
	static function getInt(f:hxd.fmt.tiff.Data.TifFile, tag:hxd.fmt.tiff.Data.TifTag):Int;
}
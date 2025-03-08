package hxd.res;

typedef TiledMapLayer = {
	var data : Array<Int>;
	var name : String;
	var objects : Array<{ public var y(default, default) : Int; public var x(default, default) : Int; public var type(default, default) : String; public var name(default, default) : String; }>;
	var opacity : Float;
};

typedef TiledMapData = {
	var height : Int;
	var layers : Array<hxd.res.TiledMap.TiledMapLayer>;
	var width : Int;
};

@:native("hxd.res.TiledMap") extern class TiledMap extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	function toMap():hxd.res.TiledMap.TiledMapData;
}
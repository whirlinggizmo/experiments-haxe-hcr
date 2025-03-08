package hxd.res;

@:native("hxd.res.Atlas") extern class Atlas extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	function get(name:String, ?horizontalAlign:h2d.Flow.FlowAlign, ?verticalAlign:h2d.Flow.FlowAlign):h2d.Tile;
	function getAnim(?name:String, ?horizontalAlign:h2d.Flow.FlowAlign, ?verticalAlign:h2d.Flow.FlowAlign):Array<h2d.Tile>;
	function getContents():Map<String, Array<{ public var width(default, default) : Int; public var t(default, default) : h2d.Tile; public var height(default, default) : Int; }>>;
}
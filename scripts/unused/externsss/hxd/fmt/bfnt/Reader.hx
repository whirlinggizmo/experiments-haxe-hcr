package hxd.fmt.bfnt;

@:access(h2d.Font) @:native("hxd.fmt.bfnt.Reader") extern class Reader {
	function new(i:haxe.io.Input):Void;
	function read(resolveTile:String -> h2d.Tile):h2d.Font;
}
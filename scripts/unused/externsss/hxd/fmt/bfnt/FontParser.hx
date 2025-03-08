package hxd.fmt.bfnt;

@:native("hxd.fmt.bfnt.FontParser") extern class FontParser {
	@:access(h2d.Font)
	static function parse(bytes:haxe.io.Bytes, path:String, resolveTile:String -> h2d.Tile):h2d.Font;
}
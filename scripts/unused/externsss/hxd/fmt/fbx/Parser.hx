package hxd.fmt.fbx;

@:native("hxd.fmt.fbx.Parser") extern class Parser {
	static function parse(data:haxe.io.Bytes):hxd.fmt.fbx.Data.FbxNode;
}
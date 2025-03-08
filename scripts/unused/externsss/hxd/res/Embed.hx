package hxd.res;

@:keep @:native("hxd.res.Embed") extern class Embed {
	static function getFileContent(file:Dynamic):Dynamic;
	static function getResource(file:Dynamic):Dynamic;
	static function embedFont(file:Dynamic, ?chars:Dynamic, ?skipErrors:Dynamic):Dynamic;
}
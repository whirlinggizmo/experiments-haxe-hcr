package hxd;

@:build(hxd.res.FileTree.build()) @:native("hxd.Res") extern class Res {
	static function load(name:String):hxd.res.Any;
	static function initEmbed(?options:hxd.res.EmbedOptions):Dynamic;
	static function initLocal(?configuration:Dynamic):Dynamic;
	static function initPak(?file:Dynamic):Dynamic;
	static var loader(get, set) : hxd.res.Loader;
	private static function get_loader():hxd.res.Loader;
	private static function set_loader(l:hxd.res.Loader):hxd.res.Loader;
	static var prefabs(get, never) : hxd._res._Prefabs;
	static var models(get, never) : hxd._res._Models;
	static var img(get, never) : hxd._res._Img;
	static var images(get, never) : hxd._res._Images;
	static var fonts(get, never) : hxd._res._Fonts;
}
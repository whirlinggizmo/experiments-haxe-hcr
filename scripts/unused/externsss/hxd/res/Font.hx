package hxd.res;

/**
 Allows to build a font bitmap to be used by h2d.Text. Only some platforms support such runtime Font building
 and the result in terms of font quality, antialiasing, etc might vary depending on the platform.
 It is recommended to use offline BitmapFont instead, read https://heaps.io/documentation/text.html
 */
/**
	
		Allows to build a font bitmap to be used by h2d.Text. Only some platforms support such runtime Font building
		and the result in terms of font quality, antialiasing, etc might vary depending on the platform.
		It is recommended to use offline BitmapFont instead, read https://heaps.io/documentation/text.html
	
**/
@:native("hxd.res.Font") extern class Font extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	function build(size:Int, ?options:hxd.res.FontBuilder.FontBuildOptions):h2d.Font;
}
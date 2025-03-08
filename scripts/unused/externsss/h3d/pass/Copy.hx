package h3d.pass;

@:native("h3d.pass.Copy") extern class ArrayCopy extends h3d.pass.ScreenFx<ArrayCopyShader> {
	function new():Void;
	function apply(from:h3d.mat.TextureArray, fromLayer:Int, to:h3d.mat.Texture, ?blend:h3d.mat.BlendMode, ?customPass:h3d.mat.Pass, ?layer:Int):Void;
	static function run(from:h3d.mat.TextureArray, fromLayer:Int, to:h3d.mat.Texture, ?blend:h3d.mat.BlendMode, ?pass:h3d.mat.Pass, ?layer:Int):Void;
}

@:native("h3d.pass.Copy") extern class Copy extends h3d.pass.ScreenFx<CopyShader> {
	function new():Void;
	function apply(from:hxsl.Types.Texture, to:h3d.mat.Texture, ?blend:h3d.mat.BlendMode, ?customPass:h3d.mat.Pass, ?layer:Int):Void;
	static function run(from:h3d.mat.Texture, to:h3d.mat.Texture, ?blend:h3d.mat.BlendMode, ?pass:h3d.mat.Pass, ?layer:Int):Void;
}
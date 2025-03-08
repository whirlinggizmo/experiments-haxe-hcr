package h3d.pass;

@:native("h3d.pass.CubeCopy") extern class CubeCopy extends h3d.pass.ScreenFx<CubeCopyShader> {
	function new():Void;
	function apply(from:hxsl.Types.Texture, to:h3d.mat.Texture, ?blend:h3d.mat.BlendMode, ?mip:Int):Void;
	static function run(from:h3d.mat.Texture, to:h3d.mat.Texture, ?blend:h3d.mat.BlendMode, ?mip:Int):Void;
}
package h3d.pass;

@:native("h3d.pass.FXAA") extern class FXAA extends h3d.pass.ScreenFx<FXAAShader> {
	function new():Void;
	function apply(texture:h3d.mat.Texture):Void;
}
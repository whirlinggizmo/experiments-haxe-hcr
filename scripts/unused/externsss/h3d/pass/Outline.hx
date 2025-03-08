package h3d.pass;

@ignore("shader") @:native("h3d.pass.Outline") extern class Outline extends h3d.pass.ScreenFx<h3d.shader.Outline2D> {
	function new(?size:Float, ?color:Int, ?quality:Float, ?multiplyAlpha:Bool):Void;
	var size : Float;
	var color : Int;
	var alpha : Float;
	var quality : Float;
	var multiplyAlpha : Bool;
	function apply(ctx:h3d.impl.RenderContext, src:h3d.mat.Texture, ?output:h3d.mat.Texture):Void;
}
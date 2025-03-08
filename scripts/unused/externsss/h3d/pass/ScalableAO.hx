package h3d.pass;

@:native("h3d.pass.ScalableAO") extern class ScalableAO extends h3d.pass.ScreenFx<h3d.shader.SAO> {
	function new():Void;
	function apply(depthTexture:h3d.mat.Texture, normalTexture:h3d.mat.Texture, camera:h3d.Camera):Void;
}
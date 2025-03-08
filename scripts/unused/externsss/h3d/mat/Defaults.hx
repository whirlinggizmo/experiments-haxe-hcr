package h3d.mat;

@:native("h3d.mat.Defaults") extern class Defaults {
	static var defaultKillAlphaThreshold : Float;
	static var loadingTextureColor : Int;
	@:isVar
	static var shadowShader(get, set) : hxsl.Shader;
	private static function get_shadowShader():hxsl.Shader;
	private static function set_shadowShader(s:hxsl.Shader):hxsl.Shader;
	static function makeVolumeDecal(bounds:h3d.col.Bounds):hxsl.Shader;
}
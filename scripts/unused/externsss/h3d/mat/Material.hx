package h3d.mat;

@:native("h3d.mat.Material") extern class Material extends h3d.mat.BaseMaterial {
	var model : hxd.res.Resource;
	var shadows : Bool;
	var castShadows : Bool;
	var receiveShadows : Bool;
	var staticShadows : Bool;
	var textureShader : Dynamic;
	var specularShader : Dynamic;
	var texture : h3d.mat.Texture;
	var specularTexture : h3d.mat.Texture;
	var normalMap : h3d.mat.Texture;
	var color : h3d.Vector4;
	var specularAmount : Float;
	var specularPower : Float;
	var blendMode : h3d.mat.BlendMode;
	private function set_castShadows(v:Bool):Bool;
	private function set_receiveShadows(v:Bool):Bool;
	private function set_staticShadows(v:Bool):Bool;
	override function clone(?m:h3d.mat.BaseMaterial):h3d.mat.BaseMaterial;
	private function set_blendMode(v:h3d.mat.BlendMode):h3d.mat.BlendMode;
	private function get_specularTexture():h3d.mat.Texture;
	private function get_texture():h3d.mat.Texture;
	private function set_texture(t:h3d.mat.Texture):h3d.mat.Texture;
	private function get_normalMap():h3d.mat.Texture;
	private function set_normalMap(t:h3d.mat.Texture):h3d.mat.Texture;
	private function set_specularTexture(t:h3d.mat.Texture):h3d.mat.Texture;
	function getDefaultModelProps():Any;
	override function getDefaultProps(?type:String):Any;
	override function refreshProps():Void;
	static function create(?tex:h3d.mat.Texture):h3d.mat.Material;
}
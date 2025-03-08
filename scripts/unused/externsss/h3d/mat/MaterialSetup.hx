package h3d.mat;

@:native("h3d.mat.MaterialSetup") extern class MaterialSetup {
	function new(name:String):Void;
	var name(default, null) : String;
	var displayName(default, null) : String;
	function createRenderer():h3d.scene.Renderer;
	function createLightSystem():h3d.scene.LightSystem;
	function createMaterial():h3d.mat.Material;
	function getDefaults(?kind:String):Any;
	function loadMaterialProps(material:h3d.mat.Material):Any;
	function saveMaterialProps(material:h3d.mat.Material, ?defaultProps:Any):Void;
	function customMeshInit(mesh:h3d.scene.Mesh):Void;
	static var current : h3d.mat.MaterialSetup;
}
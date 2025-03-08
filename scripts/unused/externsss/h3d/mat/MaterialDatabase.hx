package h3d.mat;

@:native("h3d.mat.MaterialDatabase") extern class MaterialDatabase {
	function new():Void;
	function getModelData(model:hxd.res.Resource):{ };
	function loadMatProps(material:h3d.mat.Material, setup:h3d.mat.MaterialSetup):Any;
	function saveMatProps(material:h3d.mat.Material, setup:h3d.mat.MaterialSetup, ?defaultProps:Any):Void;
}
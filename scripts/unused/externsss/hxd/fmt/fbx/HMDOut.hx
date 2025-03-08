package hxd.fmt.fbx;

typedef CollideParams = {
	var maxConvexHulls : Int;
	var maxSubdiv : Int;
	var precision : Float;
};

@:native("hxd.fmt.fbx.HMDOut") extern class HMDOut extends hxd.fmt.fbx.BaseLibrary {
	function new(fileName:String):Void;
	var absoluteTexturePath : Bool;
	var optimizeSkin : Bool;
	var optimizeMesh : Bool;
	var generateNormals : Bool;
	var generateTangents : Bool;
	var generateCollides : hxd.fmt.fbx.HMDOut.CollideParams;
	var ignoreCollides : Array<String>;
	var lowPrecConfig : Map<String, hxd.BufferFormat.Precision>;
	var lodsDecimation : Array<Float>;
	function toHMD(filePath:String, includeGeometry:Bool):hxd.fmt.hmd.Data;
	static var lodExportKeyword : String;
	static function remapPrecision(inputName:String):String;
}
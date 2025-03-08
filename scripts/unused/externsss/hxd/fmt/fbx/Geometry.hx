package hxd.fmt.fbx;

@:native("hxd.fmt.fbx.Geometry") extern class Geometry {
	function new(l:hxd.fmt.fbx.BaseLibrary, root:hxd.fmt.fbx.Data.FbxNode):Void;
	function getRoot():hxd.fmt.fbx.Data.FbxNode;
	function getVertices():Array<Float>;
	function getPolygons():Array<Int>;
	function getMaterials():Array<Int>;
	function getMaterialByTriangle():Array<Int>;
	function merge(g:hxd.fmt.fbx.Geometry, materials:Array<Int>):Void;
	/**
		
				Decode polygon informations into triangle indexes and vertices indexes.
				Returns vidx, which is the list of vertices indexes and iout which is the index buffer for the full vertex model
			
	**/
	function getIndexes():{ var idx : Array<Int>; var vidx : Array<Int>; };
	function getPoints(?matrix:h3d.Matrix):Array<h3d.Vector>;
	function getNormals(?matrix:h3d.Matrix):Array<Float>;
	function getColors():{ public var values(default, default) : Array<Float>; public var index(default, default) : Array<Int>; };
	function getUVs():Array<{ public var values(default, default) : Array<Float>; public var index(default, default) : Array<Int>; }>;
	@:access(hxd.fmt.fbx.BaseLibrary.leftHand)
	function getGeomMatrix():h3d.Matrix;
}
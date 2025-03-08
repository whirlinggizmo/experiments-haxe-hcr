package hxd.fmt.fbx;

@:native("hxd.fmt.fbx.BaseLibrary") extern class TmpObject {
	function new():Void;
	var index : Int;
	var model : hxd.fmt.fbx.Data.FbxNode;
	var parent : hxd.fmt.fbx.BaseLibrary.TmpObject;
	var isJoint : Bool;
	var isMesh : Bool;
	var childs : Array<hxd.fmt.fbx.BaseLibrary.TmpObject>;
	var obj : h3d.scene.Object;
	var joint : h3d.anim.Skin.Joint;
	var skin : hxd.fmt.fbx.BaseLibrary.TmpObject;
}

@:native("hxd.fmt.fbx.BaseLibrary") extern class DefaultMatrixes {
	function new():Void;
	var trans : h3d.col.Point;
	var scale : h3d.col.Point;
	var rotate : h3d.col.Point;
	var preRot : h3d.col.Point;
	var wasRemoved : Int;
	var transPos : h3d.Matrix;
	function toMatrix(leftHand:Bool):h3d.Matrix;
	function toQuaternion(leftHand:Bool):h3d.Quat;
}

@:native("hxd.fmt.fbx.BaseLibrary") extern class BaseLibrary {
	function new(fileName:String):Void;
	var fileName : String;
	/**
		
				The FBX version that was decoded
			
	**/
	var version : Float;
	/**
		
				Allows to prevent some terminal unskinned joints to be removed, for instance if we want to track their position
			
	**/
	var keepJoints : Map<String, Bool>;
	/**
		
				Allows to skip some objects from being processed as if they were not part of the FBX
			
	**/
	var skipObjects : Map<String, Bool>;
	/**
		
				Use 4 bones of influence per vertex instead of 3
			
	**/
	var fourBonesByVertex : Bool;
	/**
		
				If there are too many bones, the model will be split in separate render passes.
			
	**/
	var maxBonesPerSkin : Int;
	/**
		
				Consider unskinned joints to be simple objects
			
	**/
	var unskinnedJointsAsObjects : Bool;
	var allowVertexColor : Bool;
	/**
		
				Convert centimeters to meters and axis to Z-up (Maya FBX export)
			
	**/
	var normalizeScaleOrient : Bool;
	/**
		
				Keep high precision values. Might increase animation data size and compressed size.
			
	**/
	var highPrecision : Bool;
	function loadFile(data:haxe.io.Bytes):Void;
	function load(root:hxd.fmt.fbx.Data.FbxNode):Void;
	function leftHandConvert():Void;
	function getGeometry(?name:String):hxd.fmt.fbx.Geometry;
	function getParent(node:hxd.fmt.fbx.Data.FbxNode, nodeName:String, ?opt:Bool):hxd.fmt.fbx.Data.FbxNode;
	function getChild(node:hxd.fmt.fbx.Data.FbxNode, nodeName:String, ?opt:Bool):hxd.fmt.fbx.Data.FbxNode;
	function getSpecChild(node:hxd.fmt.fbx.Data.FbxNode, name:String):hxd.fmt.fbx.Data.FbxNode;
	function getChilds(node:hxd.fmt.fbx.Data.FbxNode, ?nodeName:String):Array<hxd.fmt.fbx.Data.FbxNode>;
	function getParents(node:hxd.fmt.fbx.Data.FbxNode, ?nodeName:String):Array<hxd.fmt.fbx.Data.FbxNode>;
	function getRoot():hxd.fmt.fbx.Data.FbxNode;
	function mergeModels(modelNames:Array<String>):Void;
	/**
		
				Returns an array of names with all animations present in FBX file.
			
	**/
	function getAnimationNames():Array<String>;
	function loadAnimation(?animName:String, ?root:hxd.fmt.fbx.Data.FbxNode, ?lib:hxd.fmt.fbx.BaseLibrary):h3d.anim.Animation;
}
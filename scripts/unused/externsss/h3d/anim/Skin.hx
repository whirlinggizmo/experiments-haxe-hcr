package h3d.anim;

@:native("h3d.anim.Skin") extern class Joint {
	function new():Void;
	var index : Int;
	var name : String;
	var bindIndex : Int;
	var splitIndex : Int;
	var defMat : h3d.Matrix;
	var transPos : h3d.Matrix;
	var parent : h3d.anim.Skin.Joint;
	var follow : h3d.anim.Skin.Joint;
	var subs : Array<h3d.anim.Skin.Joint>;
	var offsets : h3d.col.Bounds;
	var offsetRay : Float;
	/**
		
				When animated, we will use the default bind pose translation instead of the animated translation,
				enabling retargeting on a skeleton with different proportions
			
	**/
	var retargetAnim : Bool;
	function shouldReceiveAnimation():Bool;
	function makeRuntimeData():h3d.scene.Skin.JointData;
}

@:native("h3d.anim.Skin") extern class DynamicJoint extends h3d.anim.Skin.Joint {
	function new():Void;
	var globalForce : h3d.Vector;
	var additive : Bool;
	var damping : Float;
	var stiffness : Float;
	var resistance : Float;
	var slackness : Float;
	override function shouldReceiveAnimation():Bool;
	override function makeRuntimeData():h3d.scene.Skin.DynamicJointData;
	static var SLEEP_THRESHOLD : Float;
}

@:native("h3d.anim.Skin") extern class Skin {
	function new(name:String, vertexCount:Int, bonesPerVertex:Int):Void;
	var name : String;
	var vertexCount(default, null) : Int;
	var bonesPerVertex(default, null) : Int;
	var vertexJoints : haxe.ds.Vector<Int>;
	var vertexWeights : haxe.ds.Vector<Float>;
	var rootJoints(default, null) : Array<h3d.anim.Skin.Joint>;
	var namedJoints(default, null) : Map<String, h3d.anim.Skin.Joint>;
	var allJoints(default, null) : Array<h3d.anim.Skin.Joint>;
	var boundJoints(default, null) : Array<h3d.anim.Skin.Joint>;
	var primitive : h3d.prim.Primitive;
	var splitJoints(default, null) : Array<{ public var material(default, default) : Int; public var joints(default, default) : Array<h3d.anim.Skin.Joint>; }>;
	var triangleGroups : haxe.ds.Vector<Int>;
	function setJoints(joints:Array<h3d.anim.Skin.Joint>, roots:Array<h3d.anim.Skin.Joint>):Void;
	function initWeights():Void;
	function split(maxBones:Int, index:Array<Int>, triangleMaterials:Array<Int>):Bool;
}
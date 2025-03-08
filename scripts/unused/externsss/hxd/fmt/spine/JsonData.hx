package hxd.fmt.spine;

typedef JCurve = haxe.ds.Either<String, Array<Float>>;

typedef JBoneAnimation = {
	@:optional
	var flipX : Array<{ public var x(default, default) : Bool; public var time(default, default) : Float; }>;
	@:optional
	var flipY : Array<{ public var y(default, default) : Bool; public var time(default, default) : Float; }>;
	@:optional
	var rotate : Array<{ public var time(default, default) : Float; @:optional
	public var curve(default, default) : hxd.fmt.spine.JsonData.JCurve; public var angle(default, default) : Float; }>;
	@:optional
	var scale : Array<{ public var y(default, default) : Float; public var x(default, default) : Float; public var time(default, default) : Float; @:optional
	public var curve(default, default) : hxd.fmt.spine.JsonData.JCurve; }>;
	@:optional
	var translate : Array<{ public var y(default, default) : Float; public var x(default, default) : Float; public var time(default, default) : Float; @:optional
	public var curve(default, default) : hxd.fmt.spine.JsonData.JCurve; }>;
};

typedef JAnimation = {
	@:optional
	var bones : haxe.DynamicAccess<hxd.fmt.spine.JsonData.JBoneAnimation>;
	@:optional
	var drawOrder : Dynamic;
	@:optional
	var events : Dynamic;
	@:optional
	var ffd : Dynamic;
	@:optional
	var ik : Dynamic;
	@:optional
	var slots : Dynamic;
};

typedef JBone = {
	var color : String;
	@:optional
	var flipX : Bool;
	@:optional
	var flipY : Bool;
	@:optional
	var inheritRotation : Bool;
	@:optional
	var inheritScale : Bool;
	@:optional
	var length : Float;
	var name : String;
	@:optional
	var parent : String;
	@:optional
	var rotation : Float;
	@:optional
	var scaleX : Float;
	@:optional
	var scaleY : Float;
	@:optional
	var x : Float;
	@:optional
	var y : Float;
};

typedef JSkeleton = {
	var hash : String;
	var height : Float;
	var images : String;
	var spine : String;
	var width : Float;
};

typedef JAttachment = {
	@:optional
	var color : String;
	@:optional
	var type : String;
};

typedef JRegionAttach = {
	@:optional
	var color : String;
	var height : Float;
	@:optional
	var rotation : Float;
	@:optional
	var scaleX : Float;
	@:optional
	var scaleY : Float;
	@:optional
	var type : String;
	var width : Float;
	@:optional
	var x : Float;
	@:optional
	var y : Float;
};

typedef JSkinMeshAttach = {
	@:optional
	var color : String;
	var edges : Array<Int>;
	var height : Int;
	var hull : Int;
	var triangles : Array<Int>;
	@:optional
	var type : String;
	var uvs : Array<Float>;
	var vertices : Array<Float>;
	var width : Int;
};

typedef JSkin = haxe.DynamicAccess<haxe.DynamicAccess<hxd.fmt.spine.JsonData.JAttachment>>;

typedef JSlot = {
	var attachment : String;
	@:optional
	var blend : String;
	var body : String;
	@:optional
	var color : String;
	var name : String;
};

typedef JsonData = {
	var animations : haxe.DynamicAccess<hxd.fmt.spine.JsonData.JAnimation>;
	var bones : Array<hxd.fmt.spine.JsonData.JBone>;
	var ik : Dynamic;
	var skeleton : hxd.fmt.spine.JsonData.JSkeleton;
	var skins : haxe.DynamicAccess<hxd.fmt.spine.JsonData.JSkin>;
	var slots : Array<hxd.fmt.spine.JsonData.JSlot>;
};
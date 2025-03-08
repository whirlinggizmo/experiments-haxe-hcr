package hxd.fmt.hmd;

typedef GeometryDataFormat = hxd.BufferFormat.InputFormat;

typedef GeometryFormat = hxd.BufferFormat.BufferInput;

typedef DataPosition = Int;

typedef Index<T> = Int;

@:native("hxd.fmt.hmd.Data") extern enum Property<T> {
	CameraFOVY(v:Float);
	Unused_HasMaterialFlags;
	HasExtraTextures;
	FourBonesByVertex;
	HasLod;
	HasCollider;
}

typedef Properties = Null<Array<hxd.fmt.hmd.Data.Property<Dynamic>>>;

@:native("hxd.fmt.hmd.Data") extern class Position {
	function new():Void;
	var x : Float;
	var y : Float;
	var z : Float;
	var qx : Float;
	var qy : Float;
	var qz : Float;
	var qw(get, never) : Float;
	var sx : Float;
	var sy : Float;
	var sz : Float;
	private function get_qw():Float;
	function toMatrix(?postScale:Bool):h3d.Matrix;
}

@:native("hxd.fmt.hmd.Data") extern class Geometry {
	function new():Void;
	var props : hxd.fmt.hmd.Data.Properties;
	var vertexCount : Int;
	var vertexFormat : hxd.BufferFormat;
	var vertexPosition : hxd.fmt.hmd.Data.DataPosition;
	var indexCount(get, never) : Int;
	var indexCounts : Array<Int>;
	var indexPosition : hxd.fmt.hmd.Data.DataPosition;
	var bounds : h3d.col.Bounds;
	private function get_indexCount():Int;
}

@:native("hxd.fmt.hmd.Data") extern class BlendShape {
	function new():Void;
	var name : String;
	var geom : hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.Geometry>;
	var vertexCount : Int;
	var vertexFormat : hxd.BufferFormat;
	var vertexPosition : hxd.fmt.hmd.Data.DataPosition;
	var indexCount : hxd.fmt.hmd.Data.DataPosition;
	var remapPosition : hxd.fmt.hmd.Data.DataPosition;
}

@:native("hxd.fmt.hmd.Data") extern class Collider {
	function new():Void;
	var vertexCounts : Array<Int>;
	var vertexPosition : hxd.fmt.hmd.Data.DataPosition;
	var indexCounts : Array<Int>;
	var indexPosition : hxd.fmt.hmd.Data.DataPosition;
}

@:native("hxd.fmt.hmd.Data") extern class Material {
	function new():Void;
	var name : String;
	var props : hxd.fmt.hmd.Data.Properties;
	var diffuseTexture : String;
	var specularTexture : String;
	var normalMap : String;
	var blendMode : h3d.mat.BlendMode;
}

@:native("hxd.fmt.hmd.Data") extern class SkinJoint {
	function new():Void;
	var name : String;
	var props : hxd.fmt.hmd.Data.Properties;
	var parent : hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.SkinJoint>;
	var position : hxd.fmt.hmd.Data.Position;
	var bind : Int;
	var transpos : hxd.fmt.hmd.Data.Position;
}

@:native("hxd.fmt.hmd.Data") extern class SkinSplit {
	function new():Void;
	var materialIndex : Int;
	var joints : Array<hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.SkinJoint>>;
}

@:native("hxd.fmt.hmd.Data") extern class Skin {
	function new():Void;
	var name : String;
	var props : hxd.fmt.hmd.Data.Properties;
	var joints : Array<hxd.fmt.hmd.Data.SkinJoint>;
	var split : Array<hxd.fmt.hmd.Data.SkinSplit>;
}

@:native("hxd.fmt.hmd.Data") extern class Model {
	function new():Void;
	var name : String;
	var props : hxd.fmt.hmd.Data.Properties;
	var parent : hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.Model>;
	var follow : String;
	var position : hxd.fmt.hmd.Data.Position;
	var geometry : hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.Geometry>;
	var materials : Array<hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.Material>>;
	var skin : hxd.fmt.hmd.Data.Skin;
	var lods : Array<hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.Model>>;
	var collider : hxd.fmt.hmd.Data.Index<hxd.fmt.hmd.Data.Collider>;
}

@:native("hxd.fmt.hmd.Data") extern enum AnimationFlag {
	HasPosition;
	HasRotation;
	HasScale;
	HasUV;
	HasAlpha;
	SingleFrame;
	HasProps;
	Reserved;
}

@:native("hxd.fmt.hmd.Data") extern class AnimationObject {
	function new():Void;
	var name : String;
	var flags : haxe.EnumFlags<hxd.fmt.hmd.Data.AnimationFlag>;
	var props : Array<String>;
	function getStride():Int;
}

@:native("hxd.fmt.hmd.Data") extern class AnimationEvent {
	function new():Void;
	var frame : Int;
	var data : String;
}

@:native("hxd.fmt.hmd.Data") extern class Animation {
	function new():Void;
	var name : String;
	var props : hxd.fmt.hmd.Data.Properties;
	var frames : Int;
	var sampling : Float;
	var speed : Float;
	var loop : Bool;
	var objects : Array<hxd.fmt.hmd.Data.AnimationObject>;
	var events : Array<hxd.fmt.hmd.Data.AnimationEvent>;
	var dataPosition : hxd.fmt.hmd.Data.DataPosition;
}

@:native("hxd.fmt.hmd.Data") extern class Data {
	function new():Void;
	var version : Int;
	var props : hxd.fmt.hmd.Data.Properties;
	var geometries : Array<hxd.fmt.hmd.Data.Geometry>;
	var materials : Array<hxd.fmt.hmd.Data.Material>;
	var models : Array<hxd.fmt.hmd.Data.Model>;
	var animations : Array<hxd.fmt.hmd.Data.Animation>;
	var shapes : Array<hxd.fmt.hmd.Data.BlendShape>;
	var colliders : Array<hxd.fmt.hmd.Data.Collider>;
	var dataPosition : Int;
	var data : haxe.io.Bytes;
	static var CURRENT_VERSION(default, never) : Int;
}
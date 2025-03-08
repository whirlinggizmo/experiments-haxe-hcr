package hxd.fmt.spine;

@:native("hxd.fmt.spine.Data") extern class Bone {
	function new():Void;
	var name : String;
	var parent : hxd.fmt.spine.Data.Bone;
	var childs : Array<hxd.fmt.spine.Data.Bone>;
	var x : Float;
	var y : Float;
	var rotation : Float;
	var scaleX : Float;
	var scaleY : Float;
	var length : Float;
	var flipX : Bool;
	var flipY : Bool;
	var inheritScale : Bool;
	var inheritRotation : Bool;
}

@:native("hxd.fmt.spine.Data") extern class Slot {
	function new():Void;
	var name : String;
	var bone : hxd.fmt.spine.Data.Bone;
	var attachment : String;
	var color : h3d.Vector4;
	var blendMode : h2d.BlendMode;
}

@:native("hxd.fmt.spine.Data") extern class Attachment {
	function new():Void;
	var skin : hxd.fmt.spine.Data.Skin;
	var slot : hxd.fmt.spine.Data.Slot;
	var color : h3d.Vector4;
}

@:native("hxd.fmt.spine.Data") extern class RegionAttachment extends hxd.fmt.spine.Data.Attachment {
	function new():Void;
	var width : Float;
	var height : Float;
}

@:native("hxd.fmt.spine.Data") extern class SkinnedVertice {
	function new():Void;
	var u : Float;
	var v : Float;
	var vx0 : Float;
	var vy0 : Float;
	var vw0 : Float;
	var vx1 : Float;
	var vy1 : Float;
	var vw1 : Float;
	var vx2 : Float;
	var vy2 : Float;
	var vw2 : Float;
	var bone0 : hxd.fmt.spine.Data.Bone;
	var bone1 : hxd.fmt.spine.Data.Bone;
	var bone2 : hxd.fmt.spine.Data.Bone;
}

@:native("hxd.fmt.spine.Data") extern class SkinnedMeshAttachment extends hxd.fmt.spine.Data.Attachment {
	function new():Void;
	var vertices : Array<hxd.fmt.spine.Data.SkinnedVertice>;
	var triangles : Array<Int>;
}

@:native("hxd.fmt.spine.Data") extern class Skin {
	function new():Void;
	var name : String;
	var attachments : Array<hxd.fmt.spine.Data.Attachment>;
}

@:native("hxd.fmt.spine.Data") extern class AnimationCurve {
	function new():Void;
}

@:native("hxd.fmt.spine.Data") extern class BoneCurve extends hxd.fmt.spine.Data.AnimationCurve {
	function new(bone:hxd.fmt.spine.Data.Bone):Void;
	var bone : hxd.fmt.spine.Data.Bone;
	var translate : haxe.ds.Vector<Float>;
	var scale : haxe.ds.Vector<Float>;
	var rotate : haxe.ds.Vector<Float>;
}

@:native("hxd.fmt.spine.Data") extern class Animation {
	function new():Void;
	var name : String;
	var curves : Array<hxd.fmt.spine.Data.AnimationCurve>;
}
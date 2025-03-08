package hxd.fmt.spine;

@:native("hxd.fmt.spine.Library") extern class Library {
	function new():Void;
	var bonesMap : Map<String, hxd.fmt.spine.Data.Bone>;
	var bones : Array<hxd.fmt.spine.Data.Bone>;
	var slots : Array<hxd.fmt.spine.Data.Slot>;
	var defaultSkin : hxd.fmt.spine.Data.Skin;
	var skins : Map<String, hxd.fmt.spine.Data.Skin>;
	var animations : Map<String, hxd.fmt.spine.Data.Animation>;
	function loadText(j:String):Void;
	function load(j:hxd.fmt.spine.JsonData):Void;
}
package hxd.snd;

@:allow(hxd.snd.Manager) @:native("hxd.snd.SoundGroup") extern class SoundGroup {
	function new(name:String):Void;
	var name(default, null) : String;
	var volume : Float;
	var maxAudible : Int;
	var mono : Bool;
}
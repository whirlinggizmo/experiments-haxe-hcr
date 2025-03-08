package hxd.snd;

@:allow(hxd.snd.Manager) @:native("hxd.snd.Effect") extern class Effect {
	function new(type:String):Void;
	@:noCompletion
	var next : hxd.snd.Effect;
	function applyAudibleVolumeModifier(v:Float):Float;
	function getVolumeModifier():Float;
}
package hxd.snd.effect;

@:native("hxd.snd.effect.Pitch") extern class Pitch extends hxd.snd.Effect {
	function new(?value:Float):Void;
	var value : Float;
}
package hxd.snd.effect;

@:native("hxd.snd.effect.LowPass") extern class LowPass extends hxd.snd.Effect {
	function new():Void;
	var gainHF : Float;
}
package hxd.snd.effect;

@:native("hxd.snd.effect.Reverb") extern class Reverb extends hxd.snd.Effect {
	function new(?preset:hxd.snd.effect.ReverbPreset):Void;
	var wetDryMix : Float;
	var room : Float;
	var roomHF : Float;
	var roomRolloffFactor : Float;
	var decayTime : Float;
	var decayHFRatio : Float;
	var reflections : Float;
	var reflectionsDelay : Float;
	var reverb : Float;
	var reverbDelay : Float;
	var diffusion : Float;
	var density : Float;
	var hfReference : Float;
	function loadPreset(preset:hxd.snd.effect.ReverbPreset):Void;
}
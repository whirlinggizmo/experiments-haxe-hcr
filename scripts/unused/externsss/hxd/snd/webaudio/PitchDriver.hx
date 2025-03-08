package hxd.snd.webaudio;

@:native("hxd.snd.webaudio.PitchDriver") extern class PitchDriver extends hxd.snd.Driver.EffectDriver<hxd.snd.effect.Pitch> {
	function new():Void;
	override function apply(e:hxd.snd.effect.Pitch, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	override function unbind(e:hxd.snd.effect.Pitch, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
}
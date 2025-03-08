package hxd.snd.webaudio;

@:native("hxd.snd.webaudio.LowPassDriver") extern class LowPassDriver extends hxd.snd.Driver.EffectDriver<hxd.snd.effect.LowPass> {
	function new():Void;
	override function bind(e:hxd.snd.effect.LowPass, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	override function apply(e:hxd.snd.effect.LowPass, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	override function unbind(e:hxd.snd.effect.LowPass, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
}
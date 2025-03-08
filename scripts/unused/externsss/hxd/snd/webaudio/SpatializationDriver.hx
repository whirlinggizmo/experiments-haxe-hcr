package hxd.snd.webaudio;

@:native("hxd.snd.webaudio.SpatializationDriver") extern class SpatializationDriver extends hxd.snd.Driver.EffectDriver<hxd.snd.effect.Spatialization> {
	function new():Void;
	override function bind(e:hxd.snd.effect.Spatialization, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	override function apply(e:hxd.snd.effect.Spatialization, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	override function unbind(e:hxd.snd.effect.Spatialization, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
}
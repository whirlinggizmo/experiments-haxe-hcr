package hxd.snd;

@:allow(hxd.snd.Manager) @:native("hxd.snd.ChannelBase") extern class ChannelBase {
	var priority : Float;
	var mute : Bool;
	var effects : Array<hxd.snd.Effect>;
	var bindedEffects : Array<hxd.snd.Effect>;
	var volume(default, set) : Float;
	function getEffect<T:(hxd.snd.Effect)>(etype:Class<T>):T;
	private function set_volume(v:Float):Float;
	function fadeTo(volume:Float, ?time:Float, ?onEnd:() -> Void):Void;
	@:access(hxd.snd.Manager)
	function addEffect<T:(hxd.snd.Effect)>(e:T):T;
	@:access(hxd.snd.Manager)
	function removeEffect(e:hxd.snd.Effect):Void;
}
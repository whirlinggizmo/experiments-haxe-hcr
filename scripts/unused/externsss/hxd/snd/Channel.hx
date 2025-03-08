package hxd.snd;

@:allow(hxd.snd.Manager) @:native("hxd.snd.Channel") extern class Channel extends hxd.snd.ChannelBase {
	@:noCompletion
	var next : hxd.snd.Channel;
	var sound(default, null) : hxd.res.Sound;
	var duration(default, null) : Float;
	var soundGroup(default, null) : hxd.snd.SoundGroup;
	var channelGroup(default, null) : hxd.snd.ChannelGroup;
	var position(default, set) : Float;
	var pause(default, set) : Bool;
	var loop : Bool;
	var allowVirtual : Bool;
	/**
		
				onEnd() is called when a sound which does not loop has finished playing
				or when we switch buffer in a queue
				or when a sound which is streamed loops.
			
	**/
	function onEnd():Void;
	private function set_position(v:Float):Float;
	private function set_pause(v:Bool):Bool;
	function calcAudibleVolume(now:Float):Void;
	/**
		
				Add a sound to the queue. When the current sound is finished playing, the next one will seamlessly continue.
				This will also trigger an onEnd() event.
			
	**/
	function queueSound(sound:hxd.res.Sound):Void;
	function stop():Void;
	function isReleased():Bool;
}
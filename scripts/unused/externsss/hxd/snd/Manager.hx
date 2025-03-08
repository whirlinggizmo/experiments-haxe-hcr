package hxd.snd;

@:access(hxd.snd.Manager) @:native("hxd.snd.Manager") extern class Source {
	function new(driver:hxd.snd.Driver):Void;
	var id(default, null) : Int;
	var handle : hxd.snd.Driver.SourceHandle;
	var channel : hxd.snd.Channel;
	var buffers : Array<hxd.snd.Manager.Buffer>;
	var volume : Float;
	var playing : Bool;
	var start : Int;
	var streamSound : hxd.res.Sound;
	var streamBuffer : haxe.io.Bytes;
	var streamStart : Int;
	var streamPos : Int;
	function dispose():Void;
}

@:access(hxd.snd.Manager) @:native("hxd.snd.Manager") extern class Buffer {
	function new(driver:hxd.snd.Driver):Void;
	var handle : hxd.snd.Driver.BufferHandle;
	var sound : hxd.res.Sound;
	var isEnd : Bool;
	var isStream : Bool;
	var refs : Int;
	var lastStop : Float;
	var start : Int;
	var end : Int;
	var samples : Int;
	var sampleRate : Int;
	function dispose():Void;
}

@:native("hxd.snd.Manager") extern class Manager {
	var masterVolume : Float;
	var masterSoundGroup(default, null) : hxd.snd.SoundGroup;
	var masterChannelGroup(default, null) : hxd.snd.ChannelGroup;
	var listener : hxd.snd.Listener;
	var timeOffset : Float;
	var suspended : Bool;
	function stopAll():Void;
	function stopAllNotLooping():Void;
	function stopByName(name:String):Void;
	/**
		
				Returns iterator with all active instances of a Sound at the call time.
			
	**/
	function getAll(sound:hxd.res.Sound):Iterator<hxd.snd.Channel>;
	function cleanCache():Void;
	function dispose():Void;
	function play(sound:hxd.res.Sound, ?channelGroup:hxd.snd.ChannelGroup, ?soundGroup:hxd.snd.SoundGroup):hxd.snd.Channel;
	function update():Void;
	static var STREAM_DURATION : Float;
	static var STREAM_BUFFER_SAMPLE_COUNT : Int;
	static var BUFFER_QUEUE_LENGTH : Int;
	static var MAX_SOURCES : Int;
	static var SOUND_BUFFER_CACHE_SIZE : Int;
	static var VIRTUAL_VOLUME_THRESHOLD : Float;
	/**
		
				Allows to decode big streaming buffers over X split frames. 0 to disable
			
	**/
	static var BUFFER_STREAM_SPLIT : Int;
	static function get():hxd.snd.Manager;
}
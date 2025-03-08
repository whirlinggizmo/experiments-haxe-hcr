package hxd.res;

@:native("hxd.res.Sound") extern enum SoundFormat {
	Wav;
	Mp3;
	OggVorbis;
}

@:native("hxd.res.Sound") extern class Sound extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	var lastPlay(default, null) : Float;
	function getData():hxd.snd.Data;
	function dispose():Void;
	function stop():Void;
	function play(?loop:Bool, ?volume:Float, ?channelGroup:hxd.snd.ChannelGroup, ?soundGroup:hxd.snd.SoundGroup):hxd.snd.Channel;
	static function supportedFormat(fmt:hxd.res.Sound.SoundFormat):Bool;
	static function startWorker():Bool;
}
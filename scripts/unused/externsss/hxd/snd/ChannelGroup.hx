package hxd.snd;

@:native("hxd.snd.ChannelGroup") extern class ChannelGroup extends hxd.snd.ChannelBase {
	function new(name:String):Void;
	var name(default, null) : String;
}
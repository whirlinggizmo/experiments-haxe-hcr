package hxd.snd;

@:native("hxd.snd.NativeChannel") extern class NativeChannel {
	function new(bufferSamples:Int):Void;
	var bufferSamples(default, null) : Int;
	function stop():Void;
}
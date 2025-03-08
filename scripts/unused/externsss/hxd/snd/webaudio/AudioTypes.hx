package hxd.snd.webaudio;

@:native("hxd.snd.webaudio.AudioTypes") extern class BufferHandle {
	function new():Void;
	var inst : js.html.audio.AudioBuffer;
	var isEnd : Bool;
	var samples : Int;
}

@:allow(hxd.snd.webaudio.Driver) @:native("hxd.snd.webaudio.AudioTypes") extern class SourceHandle {
	function new():Void;
	var sampleOffset : Int;
	var playing : Bool;
	var driver : hxd.snd.webaudio.Driver;
	var lowPass : js.html.audio.BiquadFilterNode;
	var panner : js.html.audio.PannerNode;
	var gain : js.html.audio.GainNode;
	var destination : js.html.audio.AudioNode;
	var buffers : Array<hxd.snd.webaudio.AudioTypes.BufferPlayback>;
	var pitch : Float;
	var firstPlay : Bool;
	function updateDestination():Void;
	function applyPitch():Void;
}

@:native("hxd.snd.webaudio.AudioTypes") extern class BufferPlayback {
	function new():Void;
	var buffer : hxd.snd.webaudio.AudioTypes.BufferHandle;
	var node : js.html.audio.AudioBufferSourceNode;
	var offset : Float;
	var dirty : Bool;
	var consumed : Bool;
	var starts : Float;
	var ends : Float;
	var currentSample(get, never) : Int;
	private function get_currentSample():Int;
	function set(buf:hxd.snd.webaudio.AudioTypes.BufferHandle, grainOffset:Float):Void;
	function start(ctx:js.html.audio.AudioContext, source:hxd.snd.webaudio.AudioTypes.SourceHandle, time:Float):Float;
	function readjust(time:Float, source:hxd.snd.webaudio.AudioTypes.SourceHandle):Float;
	function restart(source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	function stop(?immediate:Bool):Void;
	function clear():Void;
}
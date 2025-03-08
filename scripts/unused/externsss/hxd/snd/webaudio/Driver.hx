package hxd.snd.webaudio;

@:native("hxd.snd.webaudio.Driver") extern class Driver implements hxd.snd.Driver {
	function new():Void;
	var ctx : js.html.audio.AudioContext;
	var masterGain(get, never) : js.html.audio.GainNode;
	var destination(get, set) : js.html.audio.AudioNode;
	function hasFeature(d:hxd.snd.Driver.DriverFeature):Bool;
	function setMasterVolume(value:Float):Void;
	function setListenerParams(position:h3d.Vector, direction:h3d.Vector, up:h3d.Vector, ?velocity:h3d.Vector):Void;
	function createSource():hxd.snd.webaudio.AudioTypes.SourceHandle;
	function playSource(source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	function stopSource(source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	function setSourceVolume(source:hxd.snd.webaudio.AudioTypes.SourceHandle, value:Float):Void;
	function destroySource(source:hxd.snd.webaudio.AudioTypes.SourceHandle):Void;
	function createBuffer():hxd.snd.webaudio.AudioTypes.BufferHandle;
	function setBufferData(buffer:hxd.snd.webaudio.AudioTypes.BufferHandle, data:haxe.io.Bytes, size:Int, format:hxd.snd.Data.SampleFormat, channelCount:Int, samplingRate:Int):Void;
	function destroyBuffer(buffer:hxd.snd.webaudio.AudioTypes.BufferHandle):Void;
	function queueBuffer(source:hxd.snd.webaudio.AudioTypes.SourceHandle, buffer:hxd.snd.webaudio.AudioTypes.BufferHandle, sampleStart:Int, endOfStream:Bool):Void;
	function unqueueBuffer(source:hxd.snd.webaudio.AudioTypes.SourceHandle, buffer:hxd.snd.webaudio.AudioTypes.BufferHandle):Void;
	function getProcessedBuffers(source:hxd.snd.webaudio.AudioTypes.SourceHandle):Int;
	function getPlayedSampleCount(source:hxd.snd.webaudio.AudioTypes.SourceHandle):Int;
	function update():Void;
	function dispose():Void;
	function getEffectDriver(type:String):hxd.snd.Driver.EffectDriver<Dynamic>;
}
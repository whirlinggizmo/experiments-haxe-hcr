package hxd.snd;

typedef SourceHandle = hxd.snd.webaudio.AudioTypes.SourceHandle;

typedef BufferHandle = hxd.snd.webaudio.AudioTypes.BufferHandle;

@:native("hxd.snd.Driver") extern class EffectDriver<T> {
	function new():Void;
	function acquire():Void;
	function release():Void;
	function update(e:T):Void;
	function bind(e:T, source:hxd.snd.Driver.SourceHandle):Void;
	function apply(e:T, source:hxd.snd.Driver.SourceHandle):Void;
	function unbind(e:T, source:hxd.snd.Driver.SourceHandle):Void;
}

@:native("hxd.snd.Driver") extern enum DriverFeature {
	MasterVolume;
}

interface Driver {
	function hasFeature(d:hxd.snd.Driver.DriverFeature):Bool;
	function setMasterVolume(value:Float):Void;
	function setListenerParams(position:h3d.Vector, direction:h3d.Vector, up:h3d.Vector, ?velocity:h3d.Vector):Void;
	function createSource():hxd.snd.Driver.SourceHandle;
	function playSource(source:hxd.snd.Driver.SourceHandle):Void;
	function stopSource(source:hxd.snd.Driver.SourceHandle):Void;
	function setSourceVolume(source:hxd.snd.Driver.SourceHandle, value:Float):Void;
	function destroySource(source:hxd.snd.Driver.SourceHandle):Void;
	function createBuffer():hxd.snd.Driver.BufferHandle;
	function setBufferData(buffer:hxd.snd.Driver.BufferHandle, data:haxe.io.Bytes, size:Int, format:hxd.snd.Data.SampleFormat, channelCount:Int, samplingRate:Int):Void;
	function destroyBuffer(buffer:hxd.snd.Driver.BufferHandle):Void;
	function queueBuffer(source:hxd.snd.Driver.SourceHandle, buffer:hxd.snd.Driver.BufferHandle, sampleStart:Int, endOfStream:Bool):Void;
	function unqueueBuffer(source:hxd.snd.Driver.SourceHandle, buffer:hxd.snd.Driver.BufferHandle):Void;
	function getProcessedBuffers(source:hxd.snd.Driver.SourceHandle):Int;
	function getPlayedSampleCount(source:hxd.snd.Driver.SourceHandle):Int;
	function update():Void;
	function dispose():Void;
	function getEffectDriver(type:String):hxd.snd.Driver.EffectDriver<Dynamic>;
}
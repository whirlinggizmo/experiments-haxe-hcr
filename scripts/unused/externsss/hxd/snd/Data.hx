package hxd.snd;

@:native("hxd.snd.Data") extern enum SampleFormat {
	UI8;
	I16;
	F32;
}

@:native("hxd.snd.Data") extern class Data {
	var samples(default, null) : Int;
	var samplingRate(default, null) : Int;
	var sampleFormat(default, null) : hxd.snd.Data.SampleFormat;
	var channels(default, null) : Int;
	var duration(get, never) : Float;
	function isLoading():Bool;
	function decode(out:haxe.io.Bytes, outPos:Int, sampleStart:Int, sampleCount:Int):Void;
	function resample(rate:Int, format:hxd.snd.Data.SampleFormat, channels:Int):hxd.snd.Data;
	@:noDebug
	function resampleBuffer(out:haxe.io.Bytes, outPos:Int, input:haxe.io.Bytes, inPos:Int, rate:Int, format:hxd.snd.Data.SampleFormat, channels:Int, samples:Int):Void;
	function getBytesPerSample():Int;
	/**
		
				Some platforms might require some data to be loaded before we can start decoding.
				Use load() and wait for onEnd to make sure that the sound data and the correct number of samples is available.
				onEnd() might be called back immediately if the data is already available.
			
	**/
	function load(onEnd:() -> Void):Void;
	private function get_duration():Float;
}
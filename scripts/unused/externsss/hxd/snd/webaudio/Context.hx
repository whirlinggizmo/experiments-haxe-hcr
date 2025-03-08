package hxd.snd.webaudio;

/**
 Common part between webaudio and OpenAL emulator - AudioContext and masterGain.
 */
/**
	
		Common part between webaudio and OpenAL emulator - AudioContext and masterGain.
	
**/
@:native("hxd.snd.webaudio.Context") extern class Context {
	static var destination : js.html.audio.AudioNode;
	static var masterGain : js.html.audio.GainNode;
	static function get():js.html.audio.AudioContext;
	/**
		
				Returns free AudioBuffer instance corresponding to sample count, amount of channels and sample-rate.
			
	**/
	static function getBuffer(channels:Int, sampleCount:Int, rate:Int):js.html.audio.AudioBuffer;
	/**
		
				Puts AudioBuufer back to it's pool.
			
	**/
	static function putBuffer(buf:js.html.audio.AudioBuffer):Void;
}
package hxd;

/**
 The Timer class acts as a global time measurement that can be accessed from various parts of the engine.
 These three values are representation of the same underlying calculus: tmod, dt, fps
 */
/**
	
		The Timer class acts as a global time measurement that can be accessed from various parts of the engine.
		These three values are representation of the same underlying calculus: tmod, dt, fps
	
**/
@:native("hxd.Timer") extern class Timer {
	/**
		
				The FPS on which "tmod" have values are based on.
				Can be freely configured if your gameplay runs at a different speed.
				Default : 60
			
	**/
	static var wantedFPS : Float;
	/**
		
				The maximum amount of time between two frames (in seconds).
				If the time exceed this amount, Timer will consider these lags are to be ignored.
				Default : 0.5
			
	**/
	static var maxDeltaTime : Float;
	/**
		
				The smoothing done between frames. A smoothing of 0 gives "real time" values, higher values will smooth
				the results for tmod/dt/fps over frames using the formula   dt = lerp(elapsedTime, dt, smoothFactor)
				Default : 0 on HashLink, 0.95 on other platforms
			
	**/
	static var smoothFactor : Float;
	/**
		
				The last timestamp in which update() function was called.
			
	**/
	static var lastTimeStamp(default, null) : Float;
	/**
		
				The amount of time (unsmoothed) that was spent since the last frame.
			
	**/
	static var elapsedTime(default, null) : Float;
	/**
		
				A frame counter, increases on each call to update()
			
	**/
	static var frameCount : Int;
	/**
		
				The smoothed elapsed time (in seconds).
		
			
	**/
	static var dt : Float;
	/**
		
				The smoothed frame modifier, based on wantedFPS. Its value is the same as dt/wantedFPS
				Allows to express movements in terms of pixels-per-frame-at-wantedFPS instead of per second.
			
	**/
	static var tmod(get, set) : Float;
	/**
		
				Update the timer calculus on each frame. This is automatically called by hxd.App
			
	**/
	static function update():Void;
	/**
		
				The current smoothed FPS.
			
	**/
	static function fps():Float;
	/**
		
				After some loading / long processing, call skip() in order to prevent
				it from impacting your smoothed values.
			
	**/
	static function skip():Void;
	/**
		
				Similar as skip() but also reset dt to default value.
				Can be used when starting a new game if you want to discard any previous measurement.
			
	**/
	static function reset():Void;
}
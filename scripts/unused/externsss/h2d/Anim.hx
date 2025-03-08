package h2d;

/**
 Displays an animated sequence of bitmap Tiles on the screen.
 
 Anim does not provide animation sequence management and it's up to user on how to implement it.
 Another limitation is framerate. Anim runs at a fixed framerate dictated by `Anim.speed`.
 Switching animations can be done through `Anim.play` method.
 
 Note that animation playback happens regardless of Anim visibility and only can be paused by `Anim.pause` flag.
 Anim should be added to an active `h2d.Scene` in order to function.
 */
/**
	
		Displays an animated sequence of bitmap Tiles on the screen.
	
		Anim does not provide animation sequence management and it's up to user on how to implement it.
		Another limitation is framerate. Anim runs at a fixed framerate dictated by `Anim.speed`.
		Switching animations can be done through `Anim.play` method.
	
		Note that animation playback happens regardless of Anim visibility and only can be paused by `Anim.pause` flag. 
		Anim should be added to an active `h2d.Scene` in order to function.
	
**/
@:native("h2d.Anim") extern class Anim extends h2d.Drawable {
	/**
		
				Create a new animation with the specified frames, speed and parent object.
				@param frames An optional array of Tiles as an initial `Anim.frames` value.
				@param speed The Anim playback speed in frames per second.
				@param parent An optional parent `h2d.Object` instance to which Anim adds itself if set.
			
	**/
	function new(?frames:Array<h2d.Tile>, ?speed:Float, ?parent:h2d.Object):Void;
	/**
		
				The current animation, as a list of tile frames to display.
				If the frames are empty or if a tile is frames is null, a pink 5x5 bitmap will be displayed instead.
			
	**/
	var frames(default, null) : Array<h2d.Tile>;
	/**
		
				The current frame the animation is currently playing. Always in `[0,frames.length]` range.
				Use `Std.int(anim.currentFrame)` in order to obtain current frame index.
				Fractional value represents the progress of current frame and increases according to `Anim.speed` value.
		
				Setting frame to a negative value will wrap it around from the end of the animation. Setting negative value smaller than `-frames.length` lead to undefined behavior.
				Setting frame to a value greater than `frames.length` would cause to wrap around.
			
	**/
	var currentFrame(get, set) : Float;
	/**
		
				The speed (in frames per second) at which the animation is playing.
		
				Settings speed to a negative value is not supported and leads to undefined behavior.
			
	**/
	var speed : Float;
	/**
		
				Setting pause will suspend the animation, preventing automatic accumulation of `Anim.currentFrame` over time.
			
	**/
	var pause : Bool;
	/**
		
				Disabling loop will stop the animation at the last frame.
			
	**/
	var loop : Bool;
	/**
		
				When enabled, fading will draw two consecutive frames with alpha transition between
				them instead of directly switching from one to another when it reaches the next frame.
				This can be used to have smoother animation on some effects.
			
	**/
	var fading : Bool;
	/**
		
				Change the currently playing animation and unset the pause if it was set.
				@param frames The list of frames to play.
				@param atFrame Optional starting frame of the new animation.
			
	**/
	function play(frames:Array<h2d.Tile>, ?atFrame:Float):Void;
	/**
		
				Sent each time the animation reaches past the last frame.
		
				If `loop` is enabled, callback is sent every time the animation loops.
				During the call, `currentFrame` is already wrapped around and represent new frame position so it's safe to modify it.
		
				If `loop` is disabled, callback is sent only once when the animation reaches `currentFrame == frames.length`.
				During the call, `currentFrame` is always equals to `frames.length`.
			
	**/
	function onAnimEnd():Void;
	private function set_currentFrame(frame:Float):Float;
	/**
		
				Returns the Tile at current frame.
			
	**/
	function getFrame():h2d.Tile;
}
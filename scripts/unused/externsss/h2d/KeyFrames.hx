package h2d;

/**
 [Keyframes](https://github.com/heapsio/keyframes/) integration; A `KeyFrames` animation layer.
 */
/**
	
		[Keyframes](https://github.com/heapsio/keyframes/) integration; A `KeyFrames` animation layer.
	
**/
typedef KeyframesLayer = {
	var animations : Array<hxd.fmt.kframes.Data.KFAnimation>;
	var from : Int;
	var id : Int;
	var name : String;
	var spr : h2d.Object;
	var tiles : Array<h2d.Tile>;
	var to : Int;
};

/**
 Adobe After effect player, see [Keyframes](https://github.com/heapsio/keyframes/) library.
 */
/**
	
		Adobe After effect player, see [Keyframes](https://github.com/heapsio/keyframes/) library.
	
**/
@:native("h2d.KeyFrames") extern class KeyFrames extends h2d.Mask {
	/**
		
				Create a new KeyFrames animation instance.
				@param file The source file of the animation.
				@param filePrefix An optional directory prefix when looking up images.
				@param parent An optional parent `h2d.Object` instance to which KeyFrames adds itself if set.
			
	**/
	function new(file:hxd.fmt.kframes.Data.KeyframesFile, ?filePrefix:String, ?parent:h2d.Object):Void;
	/**
		
				The FPS provided by the KeyFrames file.
			
	**/
	var frameRate : Float;
	/**
		
				The total amount of frames in the animation.
			
	**/
	var frameCount : Int;
	/**
		
				The current playback frame with the frame display progress fraction.
			
	**/
	var currentFrame(get, set) : Float;
	/**
		
				The playback speed multiplier.
			
	**/
	var speed : Float;
	/**
		
				Pauses the playback when enabled.
			
	**/
	var pause : Bool;
	/**
		
				Whether to loop the animation or not.
			
	**/
	var loop : Bool;
	/**
		
				When looping, will interpolate between last frame and first frame.
			
	**/
	var loopInterpolate : Bool;
	/**
		
				Use bilinear texture sampling instead of nearest neighbor.
				@see `Drawable.smooth`
			
	**/
	var smooth(default, set) : Bool;
	@:dox(hide)
	@:noCompletion
	function set_smooth(v:Bool):Bool;
	/**
		
				Unpauses the playback and starts it at the specified frame.
				@param speed The playback speed multiplier at which animation should run.
				@param startFrame The frame at which the animation should start.
			
	**/
	function play(?speed:Float, ?startFrame:Int):Void;
	private function set_currentFrame(frame:Float):Float;
	/**
		
				Returns the animation layer objects under specified name.
			
	**/
	function getLayer(name:String):h2d.Object;
	/**
		
				Sent when animation reaches the end.
				`KeyFrames.currentFrame` equals to `KeyFrames.frameCount` when `KeyFrames.loop` is disabled,
				is wrapped around to 0th frame if loop is enabled.
			
	**/
	function onAnimEnd():Void;
}
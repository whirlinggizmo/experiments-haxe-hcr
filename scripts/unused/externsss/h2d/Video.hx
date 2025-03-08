package h2d;

/**
 A video file playback Drawable. Due to platform specifics, each target have their own limitations.
 
 * <span class="label">Hashlink</span>: Playback ability depends on `https://github.com/HeapsIO/hlvideo` library. It support only video with the AV1 codec packed into a WEBM container.
 
 * <span class="label">JavaScript</span>: HTML Video element will be used. Playback is restricted by content-security policy and browser decoder capabilities.
 */
/**
	
		A video file playback Drawable. Due to platform specifics, each target have their own limitations.
	
		* <span class="label">Hashlink</span>: Playback ability depends on `https://github.com/HeapsIO/hlvideo` library. It support only video with the AV1 codec packed into a WEBM container.
	
		* <span class="label">JavaScript</span>: HTML Video element will be used. Playback is restricted by content-security policy and browser decoder capabilities.
	
**/
@:native("h2d.Video") extern class Video extends h2d.Drawable {
	/**
		
				Create a new Video instance.
				@param parent An optional parent `h2d.Object` instance to which Video adds itself if set.
				@param cacheSize <span class="label">Hashlink</span>: async precomputing up to `cache` frame. If 0, synchronized computing
			
	**/
	function new(?parent:h2d.Object):Void;
	/**
		
				Video width. Value is undefined until video is ready to play.
			
	**/
	var videoWidth(default, null) : Int;
	/**
		
				Video height. Value is undefined until video is ready to play.
			
	**/
	var videoHeight(default, null) : Int;
	/**
		
				Tells if video currently playing.
			
	**/
	var playing : Bool;
	/**
		
				Tells current timestamp of the video.
			
	**/
	var time(get, null) : Float;
	/**
		
				When enabled, video will loop indefinitely.
			
	**/
	var loop(get, set) : Bool;
	/**
		
				Sent when there is an error with the decoding or playback of the video.
			
	**/
	function onError(msg:String):Void;
	/**
		
				Sent when video playback is finished.
			
	**/
	function onEnd():Void;
	@:dox(hide)
	@:noCompletion
	function get_time():Float;
	@:dox(hide)
	@:noCompletion
	function set_loop(value:Bool):Bool;
	/**
		
				Disposes of the currently playing Video and frees GPU memory.
			
	**/
	function dispose():Void;
	/**
		
				Loads and starts the video playback by specified `path` and calls `onReady` when playback becomes possible.
		
				* <span class="label">Hashlink</span>: Playback being immediately after `loadFile`, unless video was not being able to initialize.
				* <span class="label">JavaScript</span>: There won't be any video output until video is properly buffered enough data by the browser, in which case `onReady` is called.
		
				@param path The video path. Have to be valid file-system path for HL or valid URL (full or relative) for JS.
				@param onReady An optional callback signalling that video is initialized and began the video playback.
			
	**/
	function loadFile(path:String, ?onReady:() -> Void):Void;
	/**
		
				Loads and starts the video playback by specified `res` and calls `onReady` when playback becomes possible.
		
				* <span class="label">Hashlink</span>: Playback being immediately after `loadResource`, unless video was not being able to initialize.
				* <span class="label">JavaScript</span>: Not implemented
		
				@param res The heaps resource of a valid video file
				@param onReady An optional callback signalling that video is initialized and began the video playback.
			
	**/
	function loadResource(res:hxd.res.Resource, ?onReady:() -> Void):Void;
}
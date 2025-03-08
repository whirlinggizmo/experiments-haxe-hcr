package h2d;

/**
 A base class for all 2D objects that will draw something on the screen.
 
 Unlike Object base class, all properties of Drawable only apply to the current object and are not inherited by its children.
 */
/**
	
		A base class for all 2D objects that will draw something on the screen.
	
		Unlike Object base class, all properties of Drawable only apply to the current object and are not inherited by its children.
	
**/
@:native("h2d.Drawable") extern class Drawable extends h2d.Object {
	/**
		
				The color multiplier for the drawable. Can be used to adjust individually each of the four channels R,G,B,A (default [1,1,1,1])
			
	**/
	var color : h3d.Vector4;
	/**
		
				By enabling smoothing, scaling the object up or down will use hardware bilinear filtering resulting in a less crisp aspect.
		
				By default smooth is `null` in which case `Scene.defaultSmooth` value is used.
			
	**/
	var smooth : Bool;
	/**
		
				Enables texture uv wrap for this Drawable, causing tiles with uv exceeding the texture size to repeat instead of clamping on edges.
		
				Note that `tileWrap` does not use the `Tile` region as a wrapping area but instead uses underlying `h3d.mat.Texture` size.
				This is due to implementation specifics, as it just sets the `Texture.wrap` to either `Repeat` or `Clamp`.
				Because of that, proper Tile tiling can be expected only when the tile covers an entire Texture area.
			
	**/
	var tileWrap(default, set) : Bool;
	/**
		
				Setting a colorKey color value will discard all pixels that have this exact color in the tile.
			
	**/
	var colorKey(default, set) : Int;
	/**
		
				Setting a colorMatrix will apply a color transformation. See also `adjustColor`.
			
	**/
	var colorMatrix(get, set) : h3d.Matrix;
	/**
		
				Setting colorAdd will add the amount of color of each channel R,G,B,A to the object pixels.
			
	**/
	var colorAdd(get, set) : h3d.Vector;
	private function set_tileWrap(b:Bool):Bool;
	private function get_colorAdd():h3d.Vector;
	private function set_colorAdd(c:h3d.Vector):h3d.Vector;
	private function set_colorKey(v:Int):Int;
	/**
		
				Set the `Drawable.colorMatrix` value by specifying which effects to apply.
				Calling `adjustColor()` without arguments will reset the colorMatrix to `null`.
			
	**/
	function adjustColor(?col:h3d.Matrix.ColorAdjust):Void;
	private function get_colorMatrix():h3d.Matrix;
	private function set_colorMatrix(m:h3d.Matrix):h3d.Matrix;
	/**
		
				Returns the first shader of the given shader class among the drawable shaders.
				@param stype The class of the shader to look up.
			
	**/
	function getShader<T:(hxsl.Shader)>(stype:Class<T>):T;
	/**
		
				Add a shader to the drawable shaders.
		
				Keep in mind, that as stated before, drawable children do not inherit Drawable properties, which includes shaders.
			
	**/
	function addShader<T:(hxsl.Shader)>(s:T):T;
	/**
		
				Remove a shader from the drawable shaders, returns true if found or false if it was not part of our shaders.
			
	**/
	function removeShader(s:hxsl.Shader):Bool;
}
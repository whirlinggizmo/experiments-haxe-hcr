package h2d.filter;

/**
 Applies a color correction filter based on the provided matrix.
 
 Matrix values are as following:
 ```
 red        green      blue       alpha
 [   redMult,   redMult,   redMult,   redMult ]
 [ greenMult, greenMult, greenMult, greenMult ]
 [  blueMult,  blueMult,  blueMult,  blueMult ]
 [ alphaMult, alphaMult, alphaMult, alphaMult ]
 ```
 An identity matrix will result in an unmodified colors:
 ```
 [1, 0, 0, 0]
 [0, 1, 0, 0]
 [0, 0, 1, 0]
 [0, 0, 0, 1]
 ```
 
 @see `Ambient`
 */
/**
	
		Applies a color correction filter based on the provided matrix.
	
		Matrix values are as following:
		```
		     red        green      blue       alpha
		[   redMult,   redMult,   redMult,   redMult ]
		[ greenMult, greenMult, greenMult, greenMult ]
		[  blueMult,  blueMult,  blueMult,  blueMult ]
		[ alphaMult, alphaMult, alphaMult, alphaMult ]
		```
		An identity matrix will result in an unmodified colors:
		```
		[1, 0, 0, 0]
		[0, 1, 0, 0]
		[0, 0, 1, 0]
		[0, 0, 0, 1]
		```
	
		@see `Ambient`
	
**/
@:native("h2d.filter.ColorMatrix") extern class ColorMatrix extends h2d.filter.Filter {
	/**
		
				Create a new ColorMatrix filter.
		
				@param m The matrix used to modify the resulting colors.
			
	**/
	function new(?m:h3d.Matrix):Void;
	/**
		
				The matrix used to apply color correction.
			
	**/
	var matrix(get, set) : h3d.Matrix;
	override function draw(ctx:h2d.RenderContext, t:h2d.Tile):h2d.Tile;
	/**
		
				Returns a ColorMatrix filter which results in a grayscale image (0 saturation).
			
	**/
	static function grayed():h2d.filter.ColorMatrix;
}
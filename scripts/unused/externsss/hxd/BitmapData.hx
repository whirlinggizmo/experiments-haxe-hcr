package hxd;

typedef BitmapInnerData = Dynamic;

@:native("hxd.BitmapData") extern class BitmapData {
	function new(width:Int, height:Int):Void;
	var width: Int;
	var height : Int;
	function clear(color:Int):Void;
	function fill(x:Int, y:Int, width:Int, height:Int, color:Int):Void;
	function draw(x:Int, y:Int, src:hxd.BitmapData, srcX:Int, srcY:Int, width:Int, height:Int, ?blendMode:h2d.BlendMode):Void;
	function drawScaled(x:Int, y:Int, width:Int, height:Int, src:hxd.BitmapData, srcX:Int, srcY:Int, srcWidth:Int, srcHeight:Int, ?blendMode:h2d.BlendMode, ?smooth:Bool):Void;
	function line(x0:Int, y0:Int, x1:Int, y1:Int, color:Int):Void;
	function clone():hxd.BitmapData;
	function sub(x:Float, y:Float, w:Int, h:Int):hxd.BitmapData;
	/**
		
				Inform that we will perform several pixel operations on the BitmapData.
			
	**/
	function lock():Void;
	/**
		
				Inform that we have finished performing pixel operations on the BitmapData.
			
	**/
	function unlock():Void;
	/**
		
				Access the pixel color value at the given position. Note : this function can be very slow if done many times and the BitmapData has not been locked.
			
	**/
	function getPixel(x:Int, y:Int):Int;
	/**
		
				Modify the pixel color value at the given position. Note : this function can be very slow if done many times and the BitmapData has not been locked.
			
	**/
	function setPixel(x:Int, y:Int, c:Int):Void;
	function getPixels():hxd.Pixels;
	function setPixels(pixels:hxd.Pixels):Void;
	function toPNG():haxe.io.Bytes;
	static function fromNative(data:hxd.BitmapData.BitmapInnerData):hxd.BitmapData;
}
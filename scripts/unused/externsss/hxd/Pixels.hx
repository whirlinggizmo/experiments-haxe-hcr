package hxd;

@:native("hxd.Pixels") extern enum Flags {
	ReadOnly;
	AlphaPremultiplied;
}

@:forward(bytes, format, width, height, offset, flags, clear, dispose, toPNG, clone, sub, blit) typedef PixelsARGB = hxd.Pixels;

@:forward(bytes, format, width, height, offset, flags, clear, dispose, toPNG, clone, sub, blit) @:access(hxd.Pixels) typedef PixelsFloat = hxd.Pixels;

@:forward(bytes, format, width, height, offset, flags, clear, dispose, toPNG, clone, sub, blit) @:access(hxd.Pixels) typedef PixelsFloatRGBA = hxd.Pixels;

@:enum typedef Channel = Int;

@:noDebug @:native("hxd.Pixels") extern class Pixels {
	function new(width:Int, height:Int, bytes:haxe.io.Bytes, format:hxd.PixelFormat, ?offset:Int):Void;
	var bytes : haxe.io.Bytes;
	var format(get, never) : hxd.PixelFormat;
	var width(default, null) : Int;
	var height(default, null) : Int;
	var dataSize(default, null) : Int;
	var offset : Int;
	var flags : haxe.EnumFlags<hxd.Pixels.Flags>;
	function sub(x:Int, y:Int, width:Int, height:Int):hxd.Pixels;
	function blit(x:Int, y:Int, src:hxd.Pixels, srcX:Int, srcY:Int, width:Int, height:Int):Void;
	function clear(color:Int, ?preserveMask:Int):Void;
	function toVector():haxe.ds.Vector<Int>;
	function makeSquare(?copy:Bool):hxd.Pixels;
	function flipY():Void;
	function convert(target:hxd.PixelFormat):Void;
	function getPixel(x:Int, y:Int):Int;
	function setPixel(x:Int, y:Int, color:Int):Void;
	function getPixelF(x:Int, y:Int, ?v:h3d.Vector4):h3d.Vector4;
	function setPixelF(x:Int, y:Int, v:h3d.Vector4):Void;
	function dispose():Void;
	function toString():String;
	function toPNG(?level:Int):haxe.io.Bytes;
	function toDDS():haxe.io.Bytes;
	function clone():hxd.Pixels;
	static function calcDataSize(width:Int, height:Int, format:hxd.PixelFormat):Int;
	static function calcStride(width:Int, format:hxd.PixelFormat):Int;
	static function isFloatFormat(format:hxd.PixelFormat):Bool;
	/**
		
				Returns the byte offset for the requested channel (0=R,1=G,2=B,3=A)
				Returns -1 if the channel is not found
			
	**/
	static function getChannelOffset(format:hxd.PixelFormat, channel:hxd.Pixels.Channel):Int;
	static function alloc(width:Int, height:Int, format:hxd.PixelFormat):hxd.Pixels;
	/**
		
				Build DDS texture bytes from an array of pixels :
				- can contain a single image
				- can contain multiple layers (set isCubeMap = true if it's a cubemap)
				- can contain single or multiple layers with mipmaps (auto detected with diffences in size)
			
	**/
	static function toDDSLayers(pixels:Array<hxd.Pixels>, ?isCubeMap:Bool):haxe.io.Bytes;
}
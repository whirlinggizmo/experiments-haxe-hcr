package hxd.fmt.grd;

@:native("hxd.fmt.grd.Data") extern class Gradient {
	function new():Void;
	var name : String;
	var interpolation : Float;
	var colorStops : Array<hxd.fmt.grd.Data.ColorStop>;
	var transparencyStops : Array<hxd.fmt.grd.Data.TransparencyStop>;
	var gradientStops : Array<hxd.fmt.grd.Data.GradientStop>;
}

@:native("hxd.fmt.grd.Data") extern class ColorStop {
	function new():Void;
	var color : hxd.fmt.grd.Data.Color;
	var location : Int;
	var midpoint : Int;
	var type : hxd.fmt.grd.Data.ColorStopType;
}

@:native("hxd.fmt.grd.Data") extern enum ColorStopType {
	User;
	Background;
	Foreground;
}

@:native("hxd.fmt.grd.Data") extern class TransparencyStop {
	function new():Void;
	var opacity : Float;
	var location : Int;
	var midpoint : Int;
}

@:native("hxd.fmt.grd.Data") extern enum Color {
	RGB(r:Float, g:Float, b:Float);
	HSB(h:Float, s:Float, b:Float);
}

@:native("hxd.fmt.grd.Data") extern class GradientStop {
	function new():Void;
	var opacity : Float;
	var colorStop : hxd.fmt.grd.Data.ColorStop;
}

@:native("hxd.fmt.grd.Data") extern class Data extends haxe.ds.StringMap<hxd.fmt.grd.Data.Gradient> {

}
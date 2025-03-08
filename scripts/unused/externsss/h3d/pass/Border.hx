package h3d.pass;

@:native("h3d.pass.Border") extern class Border extends h3d.pass.ScreenFx<BorderShader> {
	function new(width:Int, height:Int, ?size:Int):Void;
	override function render():Void;
	override function dispose():Void;
}
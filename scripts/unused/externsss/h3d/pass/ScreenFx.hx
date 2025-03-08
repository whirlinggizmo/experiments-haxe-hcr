package h3d.pass;

@:native("h3d.pass.ScreenFx") extern class ScreenFx<T:(h3d.shader.ScreenShader)> {
	function new(shader:T, ?output:Array<hxsl.Output>):Void;
	var shader : T;
	var pass : h3d.mat.Pass;
	var primitive : h3d.prim.Primitive;
	function render():Void;
	function dispose():Void;
	static function run(shader:h3d.shader.ScreenShader, output:h3d.mat.Texture, ?layer:Int):Void;
}
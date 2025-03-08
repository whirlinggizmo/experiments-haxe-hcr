package h3d.pass;

@:native("h3d.pass.DefaultShadowMap") extern class DefaultShadowMap extends h3d.pass.DirShadowMap {
	function new(?size:Int, ?format:hxd.PixelFormat):Void;
	var color : h3d.Vector;
	override function draw(passes:h3d.pass.PassList, ?sort:h3d.pass.PassList -> Void):Void;
}
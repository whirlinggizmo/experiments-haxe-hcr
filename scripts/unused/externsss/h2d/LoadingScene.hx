package h2d;

@:native("h2d.LoadingScene") extern class LoadingScene extends h2d.Scene {
	function new(presentCooldown:Float):Void;
	override function render(engine:h3d.Engine):Void;
}
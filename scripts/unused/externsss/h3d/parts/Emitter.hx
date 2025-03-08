package h3d.parts;

@:native("h3d.parts.Emitter") extern class Emitter extends h3d.parts.Particles implements h3d.parts.Data.Randomized {
	function new(?state:h3d.parts.Data.State, ?parent:h3d.scene.Object):Void;
	var time(default, null) : Float;
	var state(default, null) : h3d.parts.Data.State;
	var speed : Float;
	var collider : h3d.parts.Collider;
	override function clear():Void;
	function setState(s:h3d.parts.Data.State):Void;
	function update(dt:Float):Void;
	function isActive():Bool;
}
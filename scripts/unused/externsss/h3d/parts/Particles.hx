package h3d.parts;

@:access(h3d.parts.Particle) @:native("h3d.parts.Particles") extern class Particles extends h3d.scene.Mesh {
	function new(?texture:h3d.mat.Texture, ?parent:h3d.scene.Object):Void;
	var frames : Array<h2d.Tile>;
	var count(default, null) : Int;
	var hasColor(default, set) : Bool;
	var sortMode : h3d.parts.Data.SortMode;
	var globalSize : Float;
	var emitTrail : Bool;
	private function set_hasColor(b:Bool):Bool;
	/**
		
				Offset all existing particles by the given values.
			
	**/
	function offsetParticles(dx:Float, dy:Float, ?dz:Float):Void;
	function clear():Void;
	function alloc():h3d.parts.Particle;
	function add(p:h3d.parts.Particle):h3d.parts.Particle;
}
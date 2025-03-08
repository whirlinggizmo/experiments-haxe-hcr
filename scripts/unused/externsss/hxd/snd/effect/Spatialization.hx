package hxd.snd.effect;

@:native("hxd.snd.effect.Spatialization") extern class Spatialization extends hxd.snd.Effect {
	function new():Void;
	var position : h3d.Vector;
	var velocity : h3d.Vector;
	var direction : h3d.Vector;
	var referenceDistance : Float;
	var maxDistance : Float;
	var fadeDistance : Float;
	var rollOffFactor : Float;
	override function getVolumeModifier():Float;
	override function applyAudibleVolumeModifier(v:Float):Float;
}
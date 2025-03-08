package hxd.snd;

@:native("hxd.snd.Listener") extern class Listener {
	function new():Void;
	var position : h3d.Vector;
	var direction : h3d.Vector;
	var velocity : h3d.Vector;
	var up : h3d.Vector;
	function syncCamera(cam:h3d.Camera):Void;
}
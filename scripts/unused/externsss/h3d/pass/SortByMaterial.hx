package h3d.pass;

@:native("h3d.pass.SortByMaterial") extern class SortByMaterial {
	function new():Void;
	function sort(passes:h3d.pass.PassList):Void;
}
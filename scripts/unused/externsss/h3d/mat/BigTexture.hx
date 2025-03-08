package h3d.mat;

@:access(h3d.mat.BigTexture) @:native("h3d.mat.BigTexture") extern class BigTextureElement {
	function new(t:h3d.mat.BigTexture, q:Dynamic, du:Float, dv:Float, su:Float, sv:Float):Void;
	var t : h3d.mat.BigTexture;
	var du : Float;
	var dv : Float;
	var su : Float;
	var sv : Float;
	var width(get, never) : Int;
	private function get_width():Int;
	var height(get, never) : Int;
	private function get_height():Int;
	function set(tex:hxd.res.Image):Void;
	function setAlpha(tex:hxd.res.Image):Void;
}

@:native("h3d.mat.BigTexture") extern class BigTexture {
	function new(id:Int, size:Int, ?bgColor:Int):Void;
	var id : Int;
	var tex : h3d.mat.Texture;
	function dispose():Void;
	function add(t:hxd.res.Image):h3d.mat.BigTexture.BigTextureElement;
	function addEmpty(width:Int, height:Int):h3d.mat.BigTexture.BigTextureElement;
	function done():Void;
}
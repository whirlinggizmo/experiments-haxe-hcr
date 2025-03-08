package hxsl;

@:native("hxsl.NXGlslOut") extern enum BlockType {
	Default;
	Globals;
	Params;
}

@:native("hxsl.NXGlslOut") extern class NXGlslOut extends hxsl.GlslOut {
	function new():Void;
}
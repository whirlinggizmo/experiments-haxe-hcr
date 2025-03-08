package h3d.impl;

@:native("h3d.impl.RendererFX") extern enum Step {
	MainDraw;
	Decals;
	Shadows;
	Lighting;
	Forward;
	BeforeTonemapping;
	AfterTonemapping;
	Overlay;
	Custom(name:String);
}

interface RendererFX {
	var enabled : Bool;
	function start(r:h3d.scene.Renderer):Void;
	function begin(r:h3d.scene.Renderer, step:h3d.impl.RendererFX.Step):Void;
	function end(r:h3d.scene.Renderer, step:h3d.impl.RendererFX.Step):Void;
	function dispose():Void;
}
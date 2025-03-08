package h3d.pass;

@:access(h3d.mat.Pass) @:native("h3d.pass.Output") extern class Output {
	function new(name:String, ?output:Array<hxsl.Output>):Void;
	var name(default, null) : String;
	function setContext(ctx:h3d.scene.RenderContext):Void;
	function dispose():Void;
	@:access(h3d.scene)
	function draw(passes:h3d.pass.PassList, ?sort:h3d.pass.PassList -> Void):Void;
	static var onShaderError : (Dynamic, h3d.pass.PassObject) -> Void;
}
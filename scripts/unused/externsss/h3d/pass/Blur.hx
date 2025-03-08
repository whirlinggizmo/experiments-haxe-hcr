package h3d.pass;

@ignore("shader") @:native("h3d.pass.Blur") extern class Blur extends h3d.pass.ScreenFx<h3d.shader.Blur> {
	function new(?radius:Float, ?gain:Float, ?linear:Float, ?quality:Float):Void;
	/**
		
				How far in pixels the blur will go.
			
	**/
	var radius(default, set) : Float;
	/**
		
				How much the blur increases or decreases the color amount (default = 1)
			
	**/
	var gain(default, set) : Float;
	/**
		
				Set linear blur instead of gaussian (default = 0).
			
	**/
	var linear(default, set) : Float;
	/**
		
				Adjust how much quality/speed tradeoff we want (default = 1)
			
	**/
	var quality(default, set) : Float;
	private function set_radius(r:Float):Float;
	private function set_quality(q:Float):Float;
	private function set_gain(s:Float):Float;
	private function set_linear(b:Float):Float;
	function getKernelSize():Int;
	function apply(ctx:h3d.impl.RenderContext, src:h3d.mat.Texture, ?output:h3d.mat.Texture):Void;
}
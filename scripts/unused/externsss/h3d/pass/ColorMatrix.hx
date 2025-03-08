package h3d.pass;

@:src({
		@param var texture:Sampler2D;
		@param var matrix:Mat4;
		@const var useAlpha:Bool;
		@const var useMask:Bool;
		@const var maskInvert:Bool;
		@const var hasSecondMatrix:Bool;
		@param var matrix2:Mat4;
		@param var mask:Sampler2D;
		@param var maskMatA:Vec3;
		@param var maskMatB:Vec3;
		@param var maskPower:Float;
		@param var maskChannel:Vec4;
		function apply(color:Vec4, mat:Mat4):Vec4 {
			return useAlpha ? color * mat : vec4(color.rgb, 1.) * mat;
		};
		function fragment() {
			if (useMask) {
				var color = texture.get(input.uv);
				var uv = vec3(input.uv, 1);
				var k = pow(mask.get(vec2(uv.dot(maskMatA), uv.dot(maskMatB))).dot(maskChannel), maskPower);
				var color2 = hasSecondMatrix ? apply(color, matrix2) : color;
				output.color = maskInvert ? mix(color2, apply(color, matrix), k) : mix(apply(color, matrix), color2, k);
			} else output.color = apply(texture.get(input.uv), matrix);
		};
	}) @:build(hxsl.Macros.buildShader()) @:autoBuild(hxsl.Macros.buildShader()) @:native("h3d.pass.ColorMatrix") extern class ColorMatrixShader extends h3d.shader.ScreenShader {
	function new():Void;
	var texture(get, set) : hxsl.Types.Texture;
	var matrix(get, set) : hxsl.Types.Matrix;
	var useAlpha(get, set) : Bool;
	var useMask(get, set) : Bool;
	var maskInvert(get, set) : Bool;
	var hasSecondMatrix(get, set) : Bool;
	var matrix2(get, set) : hxsl.Types.Matrix;
	var mask(get, set) : hxsl.Types.Texture;
	var maskMatA(get, set) : hxsl.Types.Vec;
	var maskMatB(get, set) : hxsl.Types.Vec;
	var maskPower(get, set) : Float;
	var maskChannel(get, set) : hxsl.Types.Vec4;
	override function updateConstants(globals:hxsl.Globals):Void;
	override function getParamValue(index:Int):Dynamic;
	override function getParamFloatValue(index:Int):Float;
	override function clone():hxsl.Shader;
}

@:native("h3d.pass.ColorMatrix") extern class ColorMatrix extends h3d.pass.ScreenFx<h3d.pass.ColorMatrix.ColorMatrixShader> {
	function new(?m:h3d.Matrix):Void;
	var matrix(get, set) : h3d.Matrix;
	var maskPower(get, set) : Float;
	function apply(src:h3d.mat.Texture, out:h3d.mat.Texture, ?mask:h3d.mat.Texture, ?maskMatrix:h2d.col.Matrix):Void;
}
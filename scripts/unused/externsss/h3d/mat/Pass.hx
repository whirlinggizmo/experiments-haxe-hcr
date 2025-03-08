package h3d.mat;

@:allow(h3d.mat.BaseMaterial) @:native("h3d.mat.Pass") extern class Pass {
	function new(name:String, ?shaders:hxsl.ShaderList, ?parent:h3d.mat.Pass):Void;
	var name(default, null) : String;
	@:bits(flags)
	var enableLights(default, set) : Bool;
	/**
		
				Inform the pass system that the parameters will be modified in object draw() command,
				so they will be manually uploaded by calling RenderContext.uploadParams.
			
	**/
	@:bits(flags)
	var dynamicParameters(default, set) : Bool;
	/**
		
				Mark the pass as static, this will allow some renderers or shadows to filter it
				when rendering static/dynamic parts.
			
	**/
	@:bits(flags)
	var isStatic(default, set) : Bool;
	@:bits(bits)
	var culling(default, set) : h3d.mat.Data.Face;
	@:bits(bits)
	var depthWrite(default, set) : Bool;
	@:bits(bits)
	var depthTest(default, set) : h3d.mat.Data.Compare;
	@:bits(bits)
	var blendSrc(default, set) : h3d.mat.Data.Blend;
	@:bits(bits)
	var blendDst(default, set) : h3d.mat.Data.Blend;
	@:bits(bits)
	var blendAlphaSrc(default, set) : h3d.mat.Data.Blend;
	@:bits(bits)
	var blendAlphaDst(default, set) : h3d.mat.Data.Blend;
	@:bits(bits)
	var blendOp(default, set) : h3d.mat.Data.Operation;
	@:bits(bits)
	var blendAlphaOp(default, set) : h3d.mat.Data.Operation;
	@:bits(bits)
	var wireframe(default, set) : Bool;
	@:bits(bits)
	var culled(default, set) : Bool;
	var colorMask : Int;
	var layer : Int;
	var stencil : h3d.mat.Stencil;
	function load(p:h3d.mat.Pass):Void;
	function setPassName(name:String):Void;
	function setBlendMode(b:h3d.mat.BlendMode):Void;
	function depth(write:Bool, test:h3d.mat.Data.Compare):Void;
	function setColorMask(r:Bool, g:Bool, b:Bool, a:Bool):Void;
	function setColorChannel(c:hxsl.Channel):Void;
	function setColorMaski(r:Bool, g:Bool, b:Bool, a:Bool, i:Int):Void;
	function addShader<T:(hxsl.Shader)>(s:T):T;
	function removeShader(s:hxsl.Shader):Bool;
	function removeShaders<T:(hxsl.Shader)>(t:Class<T>):Void;
	function getShader<T:(hxsl.Shader)>(t:Class<T>):T;
	function getShaderByName(name:String):hxsl.Shader;
	function clone():h3d.mat.Pass;
	private function set_enableLights(v:Bool):Bool;
	private function set_dynamicParameters(v:Bool):Bool;
	private function set_isStatic(v:Bool):Bool;
	private function set_culling(v:h3d.mat.Data.Face):h3d.mat.Data.Face;
	private function set_depthWrite(v:Bool):Bool;
	private function set_depthTest(v:h3d.mat.Data.Compare):h3d.mat.Data.Compare;
	private function set_blendSrc(v:h3d.mat.Data.Blend):h3d.mat.Data.Blend;
	private function set_blendDst(v:h3d.mat.Data.Blend):h3d.mat.Data.Blend;
	private function set_blendAlphaSrc(v:h3d.mat.Data.Blend):h3d.mat.Data.Blend;
	private function set_blendAlphaDst(v:h3d.mat.Data.Blend):h3d.mat.Data.Blend;
	private function set_blendOp(v:h3d.mat.Data.Operation):h3d.mat.Data.Operation;
	private function set_blendAlphaOp(v:h3d.mat.Data.Operation):h3d.mat.Data.Operation;
	private function set_wireframe(v:Bool):Bool;
	private function set_culled(v:Bool):Bool;
	static var enableLights_bits(default, never) : Int;
	static var enableLights_offset(default, never) : Int;
	static var enableLights_mask(default, never) : Int;
	static var dynamicParameters_bits(default, never) : Int;
	static var dynamicParameters_offset(default, never) : Int;
	static var dynamicParameters_mask(default, never) : Int;
	static var isStatic_bits(default, never) : Int;
	static var isStatic_offset(default, never) : Int;
	static var isStatic_mask(default, never) : Int;
	static var batchMode_bits(default, never) : Int;
	static var batchMode_offset(default, never) : Int;
	static var batchMode_mask(default, never) : Int;
	static var culling_bits(default, never) : Int;
	static var culling_offset(default, never) : Int;
	static var culling_mask(default, never) : Int;
	static var depthWrite_bits(default, never) : Int;
	static var depthWrite_offset(default, never) : Int;
	static var depthWrite_mask(default, never) : Int;
	static var depthTest_bits(default, never) : Int;
	static var depthTest_offset(default, never) : Int;
	static var depthTest_mask(default, never) : Int;
	static var blendSrc_bits(default, never) : Int;
	static var blendSrc_offset(default, never) : Int;
	static var blendSrc_mask(default, never) : Int;
	static var blendDst_bits(default, never) : Int;
	static var blendDst_offset(default, never) : Int;
	static var blendDst_mask(default, never) : Int;
	static var blendAlphaSrc_bits(default, never) : Int;
	static var blendAlphaSrc_offset(default, never) : Int;
	static var blendAlphaSrc_mask(default, never) : Int;
	static var blendAlphaDst_bits(default, never) : Int;
	static var blendAlphaDst_offset(default, never) : Int;
	static var blendAlphaDst_mask(default, never) : Int;
	static var blendOp_bits(default, never) : Int;
	static var blendOp_offset(default, never) : Int;
	static var blendOp_mask(default, never) : Int;
	static var blendAlphaOp_bits(default, never) : Int;
	static var blendAlphaOp_offset(default, never) : Int;
	static var blendAlphaOp_mask(default, never) : Int;
	static var wireframe_bits(default, never) : Int;
	static var wireframe_offset(default, never) : Int;
	static var wireframe_mask(default, never) : Int;
	static var culled_bits(default, never) : Int;
	static var culled_offset(default, never) : Int;
	static var culled_mask(default, never) : Int;
	static var reserved_bits(default, never) : Int;
	static var reserved_offset(default, never) : Int;
	static var reserved_mask(default, never) : Int;
}
package h3d.mat;

@:allow(h3d.mat.Material)  @:native("h3d.mat.Stencil") extern class Stencil {
	function new():Void;
	@:bits(maskBits, 8)
	var readMask(default, set) : Int;
	@:bits(maskBits, 8)
	var writeMask(default, set) : Int;
	@:bits(maskBits, 8)
	var reference(default, set) : Int;
	@:bits(opBits)
	var frontTest(default, set) : h3d.mat.Data.Compare;
	@:bits(opBits)
	var frontPass(default, set) : h3d.mat.Data.StencilOp;
	@:bits(opBits)
	var frontSTfail(default, set) : h3d.mat.Data.StencilOp;
	@:bits(opBits)
	var frontDPfail(default, set) : h3d.mat.Data.StencilOp;
	@:bits(opBits)
	var backTest(default, set) : h3d.mat.Data.Compare;
	@:bits(opBits)
	var backPass(default, set) : h3d.mat.Data.StencilOp;
	@:bits(opBits)
	var backSTfail(default, set) : h3d.mat.Data.StencilOp;
	@:bits(opBits)
	var backDPfail(default, set) : h3d.mat.Data.StencilOp;
	function setFront(stfail:h3d.mat.Data.StencilOp, dpfail:h3d.mat.Data.StencilOp, pass:h3d.mat.Data.StencilOp):Void;
	function setBack(stfail:h3d.mat.Data.StencilOp, dpfail:h3d.mat.Data.StencilOp, pass:h3d.mat.Data.StencilOp):Void;
	function setOp(stfail:h3d.mat.Data.StencilOp, dpfail:h3d.mat.Data.StencilOp, pass:h3d.mat.Data.StencilOp):Void;
	function setFunc(f:h3d.mat.Data.Compare, ?reference:Int, ?readMask:Int, ?writeMask:Int):Void;
	function clone():h3d.mat.Stencil;
	function load(s:h3d.mat.Stencil):Void;
	private function set_readMask(v:Int):Int;
	private function set_writeMask(v:Int):Int;
	private function set_reference(v:Int):Int;
	private function set_frontTest(v:h3d.mat.Data.Compare):h3d.mat.Data.Compare;
	private function set_frontPass(v:h3d.mat.Data.StencilOp):h3d.mat.Data.StencilOp;
	private function set_frontSTfail(v:h3d.mat.Data.StencilOp):h3d.mat.Data.StencilOp;
	private function set_frontDPfail(v:h3d.mat.Data.StencilOp):h3d.mat.Data.StencilOp;
	private function set_backTest(v:h3d.mat.Data.Compare):h3d.mat.Data.Compare;
	private function set_backPass(v:h3d.mat.Data.StencilOp):h3d.mat.Data.StencilOp;
	private function set_backSTfail(v:h3d.mat.Data.StencilOp):h3d.mat.Data.StencilOp;
	private function set_backDPfail(v:h3d.mat.Data.StencilOp):h3d.mat.Data.StencilOp;
	static var readMask_bits(default, never) : Int;
	static var readMask_offset(default, never) : Int;
	static var readMask_mask(default, never) : Int;
	static var writeMask_bits(default, never) : Int;
	static var writeMask_offset(default, never) : Int;
	static var writeMask_mask(default, never) : Int;
	static var reference_bits(default, never) : Int;
	static var reference_offset(default, never) : Int;
	static var reference_mask(default, never) : Int;
	static var frontTest_bits(default, never) : Int;
	static var frontTest_offset(default, never) : Int;
	static var frontTest_mask(default, never) : Int;
	static var frontPass_bits(default, never) : Int;
	static var frontPass_offset(default, never) : Int;
	static var frontPass_mask(default, never) : Int;
	static var frontSTfail_bits(default, never) : Int;
	static var frontSTfail_offset(default, never) : Int;
	static var frontSTfail_mask(default, never) : Int;
	static var frontDPfail_bits(default, never) : Int;
	static var frontDPfail_offset(default, never) : Int;
	static var frontDPfail_mask(default, never) : Int;
	static var backTest_bits(default, never) : Int;
	static var backTest_offset(default, never) : Int;
	static var backTest_mask(default, never) : Int;
	static var backPass_bits(default, never) : Int;
	static var backPass_offset(default, never) : Int;
	static var backPass_mask(default, never) : Int;
	static var backSTfail_bits(default, never) : Int;
	static var backSTfail_offset(default, never) : Int;
	static var backSTfail_mask(default, never) : Int;
	static var backDPfail_bits(default, never) : Int;
	static var backDPfail_offset(default, never) : Int;
	static var backDPfail_mask(default, never) : Int;
}
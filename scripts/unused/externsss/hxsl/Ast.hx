package hxsl;

@:native("hxsl.Ast") extern enum Component {
	X;
	Y;
	Z;
	W;
}

@:native("hxsl.Ast") extern enum BufferKind {
	Uniform;
	Storage;
	RW;
	Partial;
	StoragePartial;
	RWPartial;
}

@:native("hxsl.Ast") extern enum TexDimension {
	T1D;
	T2D;
	T3D;
	TCube;
}

@:native("hxsl.Ast") extern enum Type {
	TVoid;
	TInt;
	TBool;
	TFloat;
	TString;
	TVec(size:Int, t:hxsl.Ast.VecType);
	TMat3;
	TMat4;
	TMat3x4;
	TBytes(size:Int);
	TSampler(dim:hxsl.Ast.TexDimension, isArray:Bool);
	TRWTexture(dim:hxsl.Ast.TexDimension, isArray:Bool, channels:Int);
	TMat2;
	TStruct(vl:Array<hxsl.Ast.TVar>);
	TFun(variants:Array<hxsl.Ast.FunType>);
	TArray(t:hxsl.Ast.Type, size:hxsl.Ast.SizeDecl);
	TBuffer(t:hxsl.Ast.Type, size:hxsl.Ast.SizeDecl, kind:hxsl.Ast.BufferKind);
	TChannel(size:Int);
}

@:native("hxsl.Ast") extern enum VecType {
	VInt;
	VFloat;
	VBool;
}

@:native("hxsl.Ast") extern enum SizeDecl {
	SConst(v:Int);
	SVar(v:hxsl.Ast.TVar);
}

typedef FunType = {
	var args : Array<{ public var type(default, default) : hxsl.Ast.Type; public var name(default, default) : String; }>;
	var ret : hxsl.Ast.Type;
};

@:native("hxsl.Ast") extern class Error {
	function new(msg:String, pos:hxsl.Ast.Position):Void;
	var msg : String;
	var pos : hxsl.Ast.Position;
	function toString():String;
	static function t(msg:String, pos:hxsl.Ast.Position):Dynamic;
}

typedef Position = haxe.macro.Expr.Position;

typedef Expr = {
	var expr : hxsl.Ast.ExprDef;
	var pos : hxsl.Ast.Position;
};

typedef Binop = haxe.macro.Expr.Binop;

typedef Unop = haxe.macro.Expr.Unop;

@:native("hxsl.Ast") extern enum VarKind {
	Global;
	Input;
	Param;
	Var;
	Local;
	Output;
	Function;
}

@:native("hxsl.Ast") extern enum VarQualifier {
	Const(?max:Int);
	Private;
	Nullable;
	PerObject;
	Name(n:String);
	Shared;
	Precision(p:hxsl.Ast.Prec);
	Range(min:Float, max:Float);
	Ignore;
	PerInstance(v:Int);
	Doc(s:String);
	Borrow(source:String);
	Sampler(name:String);
	Final;
	Flat;
}

@:native("hxsl.Ast") extern enum Prec {
	Low;
	Medium;
	High;
}

typedef VarDecl = {
	var expr : hxsl.Ast.Expr;
	var kind : hxsl.Ast.VarKind;
	var name : String;
	var qualifiers : Array<hxsl.Ast.VarQualifier>;
	var type : hxsl.Ast.Type;
};

typedef FunDecl = {
	var args : Array<hxsl.Ast.VarDecl>;
	var expr : hxsl.Ast.Expr;
	var name : String;
	var ret : hxsl.Ast.Type;
};

@:native("hxsl.Ast") extern enum Const {
	CNull;
	CBool(b:Bool);
	CInt(v:Int);
	CFloat(v:Float);
	CString(v:String);
}

@:native("hxsl.Ast") extern enum ExprDef {
	EConst(c:hxsl.Ast.Const);
	EIdent(i:String);
	EParenthesis(e:hxsl.Ast.Expr);
	EField(e:hxsl.Ast.Expr, f:String);
	EBinop(op:hxsl.Ast.Binop, e1:hxsl.Ast.Expr, e2:hxsl.Ast.Expr);
	EUnop(op:hxsl.Ast.Unop, e1:hxsl.Ast.Expr);
	ECall(e:hxsl.Ast.Expr, args:Array<hxsl.Ast.Expr>);
	EBlock(el:Array<hxsl.Ast.Expr>);
	EVars(v:Array<hxsl.Ast.VarDecl>);
	EFunction(f:hxsl.Ast.FunDecl);
	EIf(econd:hxsl.Ast.Expr, eif:hxsl.Ast.Expr, eelse:hxsl.Ast.Expr);
	EDiscard;
	EFor(v:String, loop:hxsl.Ast.Expr, block:hxsl.Ast.Expr);
	EReturn(?e:hxsl.Ast.Expr);
	EBreak;
	EContinue;
	EArray(e:hxsl.Ast.Expr, eindex:hxsl.Ast.Expr);
	EArrayDecl(el:Array<hxsl.Ast.Expr>);
	ESwitch(e:hxsl.Ast.Expr, cases:Array<{ public var values(default, default) : Array<hxsl.Ast.Expr>; public var expr(default, default) : hxsl.Ast.Expr; }>, def:hxsl.Ast.Expr);
	EWhile(cond:hxsl.Ast.Expr, loop:hxsl.Ast.Expr, normalWhile:Bool);
	EMeta(name:String, args:Array<hxsl.Ast.Expr>, e:hxsl.Ast.Expr);
}

@:native("hxsl.Ast") extern enum TExprDef {
	TConst(c:hxsl.Ast.Const);
	TVar(v:hxsl.Ast.TVar);
	TGlobal(g:hxsl.Ast.TGlobal);
	TParenthesis(e:hxsl.Ast.TExpr);
	TBlock(el:Array<hxsl.Ast.TExpr>);
	TBinop(op:hxsl.Ast.Binop, e1:hxsl.Ast.TExpr, e2:hxsl.Ast.TExpr);
	TUnop(op:hxsl.Ast.Unop, e1:hxsl.Ast.TExpr);
	TVarDecl(v:hxsl.Ast.TVar, ?init:hxsl.Ast.TExpr);
	TCall(e:hxsl.Ast.TExpr, args:Array<hxsl.Ast.TExpr>);
	TSwiz(e:hxsl.Ast.TExpr, regs:Array<hxsl.Ast.Component>);
	TIf(econd:hxsl.Ast.TExpr, eif:hxsl.Ast.TExpr, eelse:hxsl.Ast.TExpr);
	TDiscard;
	TReturn(?e:hxsl.Ast.TExpr);
	TFor(v:hxsl.Ast.TVar, it:hxsl.Ast.TExpr, loop:hxsl.Ast.TExpr);
	TContinue;
	TBreak;
	TArray(e:hxsl.Ast.TExpr, index:hxsl.Ast.TExpr);
	TArrayDecl(el:Array<hxsl.Ast.TExpr>);
	TSwitch(e:hxsl.Ast.TExpr, cases:Array<{ public var values(default, default) : Array<hxsl.Ast.TExpr>; public var expr(default, default) : hxsl.Ast.TExpr; }>, def:hxsl.Ast.TExpr);
	TWhile(e:hxsl.Ast.TExpr, loop:hxsl.Ast.TExpr, normalWhile:Bool);
	TMeta(m:String, args:Array<hxsl.Ast.Const>, e:hxsl.Ast.TExpr);
	TField(e:hxsl.Ast.TExpr, name:String);
	TSyntax(target:String, code:String, args:Array<hxsl.Ast.SyntaxArg>);
}

typedef TVar = {
	var id : Int;
	var kind : hxsl.Ast.VarKind;
	var name : String;
	@:optional
	var parent : hxsl.Ast.TVar;
	@:optional
	var qualifiers : Array<hxsl.Ast.VarQualifier>;
	var type : hxsl.Ast.Type;
};

typedef TFunction = {
	var args : Array<hxsl.Ast.TVar>;
	var expr : hxsl.Ast.TExpr;
	var kind : hxsl.Ast.FunctionKind;
	var ref : hxsl.Ast.TVar;
	var ret : hxsl.Ast.Type;
};

@:native("hxsl.Ast") extern enum FunctionKind {
	Vertex;
	Fragment;
	Init;
	Helper;
	Main;
}

@:native("hxsl.Ast") extern enum TGlobal {
	Radians;
	Degrees;
	Sin;
	Cos;
	Tan;
	Asin;
	Acos;
	Atan;
	Pow;
	Exp;
	Log;
	Exp2;
	Log2;
	Sqrt;
	Inversesqrt;
	Abs;
	Sign;
	Floor;
	Ceil;
	Fract;
	Mod;
	Min;
	Max;
	Clamp;
	Mix;
	InvLerp;
	Step;
	Smoothstep;
	Length;
	Distance;
	Dot;
	Cross;
	Normalize;
	LReflect;
	Texture;
	TextureLod;
	Texel;
	TextureSize;
	ToInt;
	ToFloat;
	ToBool;
	Vec2;
	Vec3;
	Vec4;
	IVec2;
	IVec3;
	IVec4;
	BVec2;
	BVec3;
	BVec4;
	Mat2;
	Mat3;
	Mat4;
	Mat3x4;
	Saturate;
	Pack;
	Unpack;
	PackNormal;
	UnpackNormal;
	ScreenToUv;
	UvToScreen;
	DFdx;
	DFdy;
	Fwidth;
	ChannelRead;
	ChannelReadLod;
	ChannelFetch;
	ChannelTextureSize;
	Trace;
	VertexID;
	InstanceID;
	FragCoord;
	FrontFacing;
	FloatBitsToInt;
	FloatBitsToUint;
	IntBitsToFloat;
	UintBitsToFloat;
	RoundEven;
	SetLayout;
	ImageStore;
	ComputeVar_GlobalInvocation;
	ComputeVar_LocalInvocation;
	ComputeVar_WorkGroup;
	ComputeVar_LocalInvocationIndex;
	AtomicAdd;
	GroupMemoryBarrier;
	UnpackSnorm4x8;
	UnpackUnorm4x8;
}

@:native("hxsl.Ast") extern enum SyntaxArgAccess {
	Read;
	Write;
	ReadWrite;
}

typedef SyntaxArg = {
	var access : hxsl.Ast.SyntaxArgAccess;
	var e : hxsl.Ast.TExpr;
};

typedef TExpr = {
	var e : hxsl.Ast.TExprDef;
	var p : hxsl.Ast.Position;
	var t : hxsl.Ast.Type;
};

typedef ShaderData = {
	var funs : Array<hxsl.Ast.TFunction>;
	var name : String;
	var vars : Array<hxsl.Ast.TVar>;
};

@:native("hxsl.Ast") extern class Tools {
	static var SWIZ : Array<hxsl.Ast.Component>;
	static var MAX_CHANNELS_BITS : Int;
	static var MAX_PARTIAL_MAPPINGS_BITS : Int;
	static function allocVarId():Int;
	static function getTexUVSize(dim:hxsl.Ast.TexDimension, ?arr:Bool):Int;
	static function getDimSize(dim:hxsl.Ast.TexDimension, ?arr:Bool):Int;
	static function getName(v:hxsl.Ast.TVar):String;
	static function getDoc(v:hxsl.Ast.TVar):String;
	static function getConstBits(v:hxsl.Ast.TVar):Int;
	static function isConst(v:hxsl.Ast.TVar):Bool;
	static function isStruct(v:hxsl.Ast.TVar):Bool;
	static function isArray(v:hxsl.Ast.TVar):Bool;
	static function hasQualifier(v:hxsl.Ast.TVar, q:hxsl.Ast.VarQualifier):Bool;
	static function hasBorrowQualifier(v:hxsl.Ast.TVar, path:String):Bool;
	static function isTexture(t:hxsl.Ast.Type):Bool;
	static function toString(t:hxsl.Ast.Type):String;
	static function toType(t:hxsl.Ast.VecType):hxsl.Ast.Type;
	static function hasSideEffect(e:hxsl.Ast.TExpr):Bool;
	static function iter(e:hxsl.Ast.TExpr, f:hxsl.Ast.TExpr -> Void):Void;
	static function map(e:hxsl.Ast.TExpr, f:hxsl.Ast.TExpr -> hxsl.Ast.TExpr):hxsl.Ast.TExpr;
	static function size(t:hxsl.Ast.Type):Int;
	static function evalConst(e:hxsl.Ast.TExpr):Dynamic;
}

@:native("hxsl.Ast") extern class Tools2 {
	static function toString(g:hxsl.Ast.TGlobal):String;
}

@:native("hxsl.Ast") extern class Tools3 {
	static function toString(s:hxsl.Ast.ShaderData):String;
}

@:native("hxsl.Ast") extern class Tools4 {
	static function toString(e:hxsl.Ast.TExpr):String;
}
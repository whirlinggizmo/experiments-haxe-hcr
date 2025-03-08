package hxsl;

@:native("hxsl.Output") extern enum Output {
	Const(v:Float);
	Value(v:String, ?size:Int);
	PackNormal(v:hxsl.Output);
	PackFloat(v:hxsl.Output);
	Vec2(a:Array<hxsl.Output>);
	Vec3(a:Array<hxsl.Output>);
	Vec4(a:Array<hxsl.Output>);
	Swiz(a:hxsl.Output, swiz:Array<hxsl.Ast.Component>);
}
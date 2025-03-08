package hxd.fmt.fbx;

@:native("hxd.fmt.fbx.Data") extern enum FbxProp {
	PInt(v:Int);
	PFloat(v:Float);
	PString(v:String);
	PIdent(i:String);
	PInts(v:Array<Int>);
	PFloats(v:Array<Float>);
	PBinary(v:haxe.io.Bytes);
}

typedef FbxNode = {
	var childs : Array<hxd.fmt.fbx.Data.FbxNode>;
	var name : String;
	var props : Array<hxd.fmt.fbx.Data.FbxProp>;
};

@:native("hxd.fmt.fbx.Data") extern class FbxTools {
	static function get(n:hxd.fmt.fbx.Data.FbxNode, path:String, ?opt:Bool):hxd.fmt.fbx.Data.FbxNode;
	static function getAll(n:hxd.fmt.fbx.Data.FbxNode, path:String):Array<hxd.fmt.fbx.Data.FbxNode>;
	static function getInts(n:hxd.fmt.fbx.Data.FbxNode):Array<Int>;
	static function getFloats(n:hxd.fmt.fbx.Data.FbxNode):Array<Float>;
	static function hasProp(n:hxd.fmt.fbx.Data.FbxNode, p:hxd.fmt.fbx.Data.FbxProp):Bool;
	static function toInt(n:hxd.fmt.fbx.Data.FbxProp):Int;
	static function toFloat(n:hxd.fmt.fbx.Data.FbxProp):Float;
	static function toString(n:hxd.fmt.fbx.Data.FbxProp):String;
	static function toBinary(n:hxd.fmt.fbx.Data.FbxProp):haxe.io.Bytes;
	static function getId(n:hxd.fmt.fbx.Data.FbxNode):Int;
	static function getName(n:hxd.fmt.fbx.Data.FbxNode):String;
	static function getType(n:hxd.fmt.fbx.Data.FbxNode):String;
}
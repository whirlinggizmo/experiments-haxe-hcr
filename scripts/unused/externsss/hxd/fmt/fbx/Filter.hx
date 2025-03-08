package hxd.fmt.fbx;

@:native("hxd.fmt.fbx.Filter") extern class Filter {
	function new():Void;
	function ignore(path:String):Void;
	function filter(f:hxd.fmt.fbx.Data.FbxNode):hxd.fmt.fbx.Data.FbxNode;
}
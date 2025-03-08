package hxd.fmt.fbx;

typedef ExportParams = {
	var forward : String;
	var forwardSign : String;
	var up : String;
	var upSign : String;
};

@:native("hxd.fmt.fbx.Writer") extern class Writer {
	function new(out:haxe.io.Output):Void;
	function write(objects:Array<h3d.scene.Object>, ?params:Dynamic):Void;
	function export(toExport:Array<h3d.scene.Object>, destinationPath:String, callb:() -> Void, ?params:hxd.fmt.fbx.Writer.ExportParams):Void;
}
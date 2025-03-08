package hxd.res;

@:native("hxd.res.Model") extern class Model extends hxd.res.Resource {
	function new(entry:hxd.fs.FileEntry):Void;
	function toHmd():hxd.fmt.hmd.Library;
}
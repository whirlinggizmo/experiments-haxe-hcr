package hxd.impl;

@:native("hxd.impl.AnyProps") extern class AnyProps {
	var props(default, set) : Any;
	private function set_props(p:Any):Any;
	function setDefaultProps(kind:String):Void;
	function getDefaultProps(?kind:String):Any;
	function refreshProps():Void;
}
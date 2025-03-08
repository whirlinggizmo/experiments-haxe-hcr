package hxd.net;

@:native("hxd.net.Socket") extern class Socket {
	function new():Void;
	var out(default, null) : SocketOutput;
	var input(default, null) : SocketInput;
	var timeout(default, set) : Float;
	function set_timeout(t:Float):Float;
	function connect(host:String, port:Int, onConnect:() -> Void):Void;
	function bind(host:String, port:Int, onConnect:hxd.net.Socket -> Void, ?listenCount:Int):Void;
	function close():Void;
	function onError(msg:String):Void;
	function onData():Void;
	static var ALLOW_BIND(default, never) : Bool;
}
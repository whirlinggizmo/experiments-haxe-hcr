package hxd.net;

@:native("hxd.net.SocketHost") extern class SocketClient extends hxbit.NetworkHost.NetworkClient {
	function new(host:hxbit.NetworkHost, s:hxd.net.Socket):Void;
	override function stop():Void;
}

@:native("hxd.net.SocketHost") extern class SocketHost extends hxbit.NetworkHost {
	function new():Void;
	var enableSound : Bool;
	override function dispose():Void;
	function connect(host:String, port:Int, ?onConnect:Bool -> Void):Void;
	function wait(host:String, port:Int, ?onConnected:hxbit.NetworkHost.NetworkClient -> Void):Void;
	function offlineServer():Void;
}
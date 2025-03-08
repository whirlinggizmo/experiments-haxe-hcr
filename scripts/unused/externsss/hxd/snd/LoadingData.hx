package hxd.snd;

@:native("hxd.snd.LoadingData") extern class LoadingData extends hxd.snd.Data {
	function new(snd:hxd.res.Sound):Void;
	override function decode(out:haxe.io.Bytes, outPos:Int, sampleStart:Int, sampleCount:Int):Void;
	override function load(onEnd:() -> Void):Void;
}
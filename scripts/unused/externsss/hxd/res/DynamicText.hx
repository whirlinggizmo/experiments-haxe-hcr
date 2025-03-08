package hxd.res;

typedef DynamicTextMeta = Map<String, hxd.res.DynamicText.DynamicTextMetaContent>;

typedef DynamicTextMetaContent = {
	var skip : Bool;
	var sub : hxd.res.DynamicText.DynamicTextMeta;
};

typedef NoArg = { };

typedef Key<T> = String;

@:native("hxd.res.DynamicText") extern class DynamicText {
	static function parse(data:String):Dynamic;
	static function parseMetaData(data:String):hxd.res.DynamicText.DynamicTextMeta;
	static var r_attr : EReg;
	static function applyRec(path:Array<String>, obj:Dynamic, data:haxe.xml.Access, ref:haxe.xml.Access, onMissing:(Array<String>, String) -> String):Void;
}
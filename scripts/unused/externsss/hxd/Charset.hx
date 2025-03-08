package hxd;

@:native("hxd.Charset") extern class Charset {
	function resolveChar<T>(code:Int, glyphs:Map<Int, T>):T;
	function isCJK(code:Int):Bool;
	function isSpace(code:Int):Bool;
	function isBreakChar(code:Int):Bool;
	function isComplementChar(code:Int):Bool;
	/**
		
				Contains the whole ASCII charset.
			
	**/
	static var ASCII : String;
	/**
		
				The Latin1 (ISO 8859-1) charset (only the extra chars, no the ASCII part) + euro symbol
			
	**/
	static var LATIN1 : String;
	/**
		
				Russian support
			
	**/
	static var CYRILLIC : String;
	/**
		
				Polish support
			
	**/
	static var POLISH : String;
	/**
		
				Turkish support
			
	**/
	static var TURKISH : String;
	/**
		
				Contains Hiragana, Katanaga, japanese punctuaction and full width space (0x3000) full width numbers (0-9) and some full width ascii punctuation (!:?%&()-). Does not include full width A-Za-z.
			
	**/
	static var JP_KANA : String;
	/**
		
				Special unicode chars (fallback chars)
			
	**/
	static var UNICODE_SPECIALS : String;
	static var DEFAULT_CHARS : String;
	static function getDefault():hxd.Charset;
}
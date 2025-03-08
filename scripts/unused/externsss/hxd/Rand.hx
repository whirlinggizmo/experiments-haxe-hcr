package hxd;

/**
 `hxd.Rand` is a seeded random number generator, that allows to get always the same results starting from a given seed.
 */
/**
	
		`hxd.Rand` is a seeded random number generator, that allows to get always the same results starting from a given seed.
	
**/
@:native("hxd.Rand") extern class Rand {
	/**
		
				Create a random generator with a seed.
			
	**/
	function new(seed:Int):Void;
	/**
		
				Initialize the random generator with a seed.
			
	**/
	function init(seed:Int):Void;
	static function hash(n:Int, ?seed:Int):Int;
	/**
		
				Create a randomized hxd.Rand (using a Std.random number as seed)
			
	**/
	static function create():hxd.Rand;
}
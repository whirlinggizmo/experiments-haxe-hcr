package h2d;

/**
 The console argument type.
 */
/**
	
		The console argument type.
	
**/
@:native("h2d.Console") extern enum ConsoleArg {
	/**
		
				An integer parameter.
			
	**/
	AInt;
	/**
		
				A floating-point parameter.
			
	**/
	AFloat;
	/**
		
				A text string parameter.
			
	**/
	AString;
	/**
		
				A boolean parameter. Can be `true`, `false`, `1` or `0`.
			
	**/
	ABool;
	/**
		
				A text string parameter with limitation to only accept the specified list values.
			
	**/
	AEnum(values:Array<String>);
	/**
		
				An array of remaining arguments.
			
	**/
	AArray(t:h2d.Console.ConsoleArg);
}

/**
 A descriptor for an argument of a console command.
 */
/**
	
		A descriptor for an argument of a console command.
	
**/
typedef ConsoleArgDesc = {
	var name : String;
	@:optional
	var opt : Bool;
	var t : h2d.Console.ConsoleArg;
};

/**
 A simple debug console integration.
 
 Console can be focused manually through `Console.show` and `Console.hide` methods
 as well as by pressing the key defined by `Console.shortKeyChar`.
 
 It's possible to log messages to console via `Console.log` method.
 
 By default comes with 2 commands: `help` and `cls`, which print help message
 describing all commands and clears the console logs respectively.
 
 To add custom commands, use `Console.add` and `Console.addCommand` methods.
 */
/**
	
		A simple debug console integration.
	
		Console can be focused manually through `Console.show` and `Console.hide` methods
		as well as by pressing the key defined by `Console.shortKeyChar`.
	
		It's possible to log messages to console via `Console.log` method.
	
		By default comes with 2 commands: `help` and `cls`, which print help message
		describing all commands and clears the console logs respectively.
	
		To add custom commands, use `Console.add` and `Console.addCommand` methods.
	
**/
@:native("h2d.Console") extern class Console extends h2d.Object {
	/**
		
				Create a new Console instance using the provided font and parent.
				@param font The font to use for console text input and log.
				@param parent An optional parent `h2d.Object` instance to which Console adds itself if set.
			
	**/
	function new(font:h2d.Font, ?parent:h2d.Object):Void;
	/**
		
				The text character which should be pressed in order to automatically show console input.
			
	**/
	var shortKeyChar : Int;
	/**
		
				Provide an auto-complete on Enter/Tab key and command completion hints.
			
	**/
	var autoComplete : Bool;
	/**
		
			 * Reset all commands and aliases to default
			 
	**/
	function resetCommands():Void;
	/**
		
				Add a new command to console.
				@param name Command name.
				@param help Optional command description text.
				@param args An array of command arguments.
				@param callb The callback method taking the arguments listed in `args`.
			
	**/
	function addCommand(name:String, ?help:String, args:Array<h2d.Console.ConsoleArgDesc>, callb:Dynamic):Void;
	/**
		
				Add a new command to console. <span class="label">Macro method</span>
		
				The `callb` method arguments are used to determine console argument type and names. Due to that,
				only the following callback argument types are supported: `Int`, `Float`, `String` and `Bool`.
				Another limitation is that commands added via macro do not contain description.
		
				For example:
				```haxe
				function addItem(id:Int, ?amount:Int) {
					var item = findItemById(id)
					if (amount == null) amount = 1;
					player.giveItem(item, amount);
					console.log('Added $amount x ${item.name} to player!');
				}
				// Macro call automatically takes addItem arguments.
				console.add("additem", addItem);
				// And is equivalent to using addCommand describing each argument manually:
				console.addCommand("additem", null, [{ name: "id", t: AInt }, { name: "amount", t: AInt, opt: true }], addItem);
				```
		
				@param name A String expression of the command name.
				@param callb An expression that points at the callback method.
			
	**/
	function add(name:Dynamic, callb:Dynamic):Dynamic;
	/**
		
				Add an alias to an existing command.
				@param name Command alias.
				@param command Full command name to alias.
			
	**/
	function addAlias(name:String, command:String):Void;
	/**
		
				Executes `commandLine` the same way the user would execute it.
			
	**/
	function runCommand(commandLine:String):Void;
	/**
		
				Checks if the Console is currently shown.
			
	**/
	function isActive():Bool;
	/**
		
				Hides the Console.
			
	**/
	function hide():Void;
	/**
		
				Shows and focuses the Console.
			
	**/
	function show():Void;
	/**
		
				Print to the console log.
				@param text The text to show in the log message.
				@param color Optional custom text color.
			
	**/
	function log(text:String, ?color:Int):Void;
	/**
		
				The timeout in seconds before log will automatically hide after the last message.
			
	**/
	static var HIDE_LOG_TIMEOUT : Float;
}
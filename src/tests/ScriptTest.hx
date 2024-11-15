package tests;

#if (js)
import js.Browser;
#end

class ScriptTest {
	var entity:Entity;
	final useRemotePak = false;

	public function new() {
		trace('Hello, World!');
		// Create a new entity
		entity = new Entity(7);

		/* 		
			// Example script with init function
				var scriptInstance = {
					init: function(eventEmitter:EventEmitter) {
						eventEmitter.on("attack", function(data) {
							trace("Attack received with damage: " + data.damage);
						});
					},
					attack: function(damage:Int) {
						trace("Attacking with " + damage + " damage.");
					}
			};
		 */

		// Attach the script to the entity
		entity.attachScript("Test", (scriptInstance) -> {
			// Emit an "attack" event
			entity.event.emit("attack", {damage: 50});
		});

		// Invoke the attack method on the script
		// entity.invokeScript("Test", "attack", [50]);

		// Emit an "attack" event
		// entity.emit("attack", {damage: 50});

		// Detach the script
		// entity.detachScript("Test");

		// set up a tick loop

		var timer = new haxe.Timer(Std.int(1000 / 24));
		var lastTime = haxe.Timer.stamp();
		timer.run = function() {
			var currentTime = haxe.Timer.stamp();
			var deltaTime = currentTime - lastTime;
			lastTime = currentTime;
			tick(deltaTime);
		};
	}

	public function tick(deltaTime:Float) {
		// trace('tick', deltaTime);
		if (entity != null) {
			entity.event.emit("attack", {damage: 50});
		}
	}

	public static function ready() {
		new ScriptTest();
	}

	public static function main() {
		//Logger.replaceTrace();

		#if (js && heaps)
		var window = new hxd.Window(cast Browser.document.getElementById('renderCanvas'), true);
		window.setCurrent();
		#end

		#if heaps
		#if use_remote_pak
		trace('Using remote resource paks');
		RemotePak.initRemotePak();
		RemotePak.addPakFromUrl("res/res.pak", (pakFile) -> {
			ready();
		}, (e) -> {
			trace(e);
		});
		#else
		trace('(Using embedded resource pak)');
		hxd.Res.initEmbed();
		ready();
		#end
		#else
		ready();
		#end
	}
	/*
public static function main() {
		trace('Main.main()');
		// Logger.replaceTrace();

		#if (js && heaps)
		var window = new hxd.Window(cast Browser.document.getElementById('renderCanvas'), true);
		window.setCurrent();
		#end

		#if use_remote_pak
		trace('Using remote resource paks');
		RemotePak.initRemotePak();
		RemotePak.addPakFromUrl("res/res.pak", (pakFile) -> {
			ready();
		}, (e) -> {
			trace(e);
		});
		#else
		trace('(Using embedded resource pak)');
		hxd.Res.initEmbed();
		ready();
		#end
	}
*/
}

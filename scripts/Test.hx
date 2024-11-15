@:expose
class Test extends Script {
	/*
		function onInit() {
			log("Test.init!");
		}
	 */
	function onLoad() {
		log("Test.load");
		log(ctx); // testing context:  first time should have "HELLO" (set by ScriptInstance), second should have 'mytest' and 'foo' (set by onUnload)
		log("CHANGE ME TO SEE HOTRELOAD (must be running vite and have enable-script-reload + debug in main.hxml)");
		event.on("attack", function(data) {
			log('Attack received with bar: ' + Std.int(data.damage));
		});
	}

	function onUnload() {
		log("Test.unload");
		ctx.mytest = "test"; // testing saving context before unload
		ctx.foo = "bar";
	}
	/*
		function onDestroy() {
			log("Test.destroy");
		}
	 */
	// event.on("tick", function(data) {
	// log('Tick received on Test: ' + data);
	//	});
	// }
}

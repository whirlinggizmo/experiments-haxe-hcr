@:expose
class Test extends Script {
	/*
		function onInit() {
			log("Test.init!");
		}
	 */
	function onLoad() {
		log("Test.load");
		log(ctx);
		log("HERE AGAIN");
		event.on("attack", function(data) {
			log('Attack received with bar: ' + Std.int(data.damage));
		});
	}

	function onUnload() {
		log("Test.unload");
		ctx.mytest = "test";
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

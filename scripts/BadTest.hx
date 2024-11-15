@:expose
class BadTest extends Script {
	function init() {
		trace("BadTest.init");
		event.on("attack", function(data) {
			trace('Attack received with damage: ' + Std.int(data.damage));
		});
	}
}

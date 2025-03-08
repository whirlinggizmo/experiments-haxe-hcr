
class BadTest extends Script {

	function onAttack(args) {
		log('Attack received with damage: ' + Std.int(args.damage));
	}
	function init() {
		trace("BadTest.init");
		addEventListener("attack", "onAttack");
	}
}

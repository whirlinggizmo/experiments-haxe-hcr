#if (js)
import js.Browser;
import js.html.Document;
#end

class Main {
	public static function ready() {
		new tests.ScriptTest();
		// new MainApp();
	}

	public static function main() {
		Logger.replaceTrace();

		#if (js && heaps)
		var window = new hxd.Window(cast Browser.document.getElementById('renderCanvas'), true);
		window.setCurrent();
		#end

		#if heaps
		#if use_remote_pak
		trace('Using remote resource paks');
		RemotePak.initRemotePak();
		RemotePak.addPakFromUrl("https://dev.whirlinggizmo.com/testbed/haxe/heaps-iso-chests/res/res.pak", (pakFile) -> {
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
}

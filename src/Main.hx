#if (js)
import js.Browser;
import js.html.Document;
#end
import remotePak.RemotePak;

@:expose
class Main {
	public static function ready() {
		// new tests.ScriptTest();
		new MainApp();
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
		var url = "res/res.pak";
		#if !js
		url = "https://dev.whirlinggizmo.com/testbed/haxe/heaps-iso-chests/" + url;
		#end
		RemotePak.addPakFromUrl(url, (pakFile) -> {
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

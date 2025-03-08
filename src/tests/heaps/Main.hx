package tests.heaps;

//import core.logging.Logger;

#if (js)
import js.Browser;
import js.html.Document;
#end
import tests.heaps.remotePak.RemotePak;

@:expose
class Main {
	public static function ready() {
		// new tests.ScriptTest();
		new tests.heaps.MainApp();
	}

	public static function main() {
		//Logger.replaceTrace();

		#if (js && heaps)
		var window = new hxd.Window(cast Browser.document.getElementById('renderCanvas'), true);
		window.setCurrent();
		#end

		/*
		#if heaps
		#if use_remote_pak
		trace('Using remote resource paks');
		RemotePak.initRemotePak();
		var url = "res/res.pak";
		#if !js
		url = "https://dev.whirlinggizmo.com/testbed/haxe/heaps-iso-chests/" + url;
		#end
		RemotePak.addPakFromUrl(url, (pakFile) -> {
			trace('Pak loaded from ' + url);
			ready();
		}, (e) -> {
			trace('Failed to load pak from 	' + url);
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
		*/
		ready();
	}
}

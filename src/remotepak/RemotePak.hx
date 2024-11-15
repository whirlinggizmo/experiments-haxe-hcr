package remotepak;

import hxd.fmt.pak.FileSystem;
import hxd.fmt.pak.FileSystem.FileInput;
import haxe.io.Bytes;

// #if (sys || nodejs)
// import sys.FileSystem;
// import remotepak.FileSystem;
// import remotepak.FileSystem.FileInput;
// import sys.FileSystem.FileInput;
// #else
// import hxd.fmt.pak.FileSystem;
// import hxd.fmt.pak.FileSystem.FileInput;
// #end
// import remotepak.RemoteFileSystem;
class RemotePak {
	static private var fileSystem:FileSystem = null;

	static public function addPakFromUrl(url:String, ?successCallback:FileSystem->Void, ?failCallback:String->Void) {
		// var pak = new hxd.fmt.pak.FileSystem();
		var http = new haxe.Http(url);
		http.onBytes = function(data:Bytes) {
			try {
				var f = new FileInput(data);
				#if (target.threaded && !heaps_add_pak_multithreaded)
				throw("addPak method is not designed to work in multi-threaded environment, avoid or use -D heaps_add_pak_multithreaded");
				#end
				fileSystem.addPak(f);
				// hxd.Res.loader = new hxd.res.Loader(pak);
				if (successCallback != null)
					successCallback(fileSystem);
			} catch (e) {
				if (failCallback != null)
					failCallback(e.message);
			}
		}
		http.onError = function(error) {
			trace('Encountered error while fetching from "$url": $error');
			failCallback(error);
		}
		http.request();
	}

	static public function initRemotePak(?url:String, ?successCallback:FileSystem->Void, ?failCallback:String->Void) {
		fileSystem = new FileSystem();
		hxd.Res.loader = new hxd.res.Loader(fileSystem);
		if (url != null) {
			addPakFromUrl(url, successCallback, failCallback);
		}
	}
}

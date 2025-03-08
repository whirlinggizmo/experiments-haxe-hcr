package tests.heaps.remotePak;

class RemotePak {
	static public var fileSystem(default, null):RemoteFileSystem = null;

	static public function addPakFromUrl(url:String, ?successCallback:RemoteFileSystem->Void, ?failCallback:String->Void) {
		fileSystem.addPackFromUrl(url, successCallback, failCallback);
	}



	 public static function initRemotePak(?url:String, ?successCallback:RemoteFileSystem->Void, ?failCallback:String->Void) {
		fileSystem = new RemoteFileSystem();
		var loader = new hxd.res.Loader(fileSystem);
		hxd.Res.loader = loader;
		hxd.res.Loader.currentInstance = loader;
		if (url != null) {
			fileSystem.fetchPak(url, (pakFile) -> {
				if (successCallback != null)
					successCallback(fileSystem);
			}, (e) -> {
				trace(e);
				if (failCallback != null)
					failCallback(e);
			});
			fileSystem.addPackFromUrl(url, successCallback, failCallback);
		} else {
			// no initial pak to load, call successCallback immediately
			if (successCallback != null) {
				successCallback(fileSystem);
			}
		}
	}
}

package remotePak;

class RemotePak {
	static public var fileSystem(default, null):RemoteFileSystem = null;

	static public function addPakFromUrl(url:String, ?successCallback:RemoteFileSystem->Void, ?failCallback:String->Void) {
		fileSystem.addPackFromUrl(url, successCallback, failCallback);
	}

	static public function initRemotePak(?url:String, ?successCallback:RemoteFileSystem->Void, ?failCallback:String->Void) {
		fileSystem = new RemoteFileSystem();
		hxd.Res.loader = new hxd.res.Loader(fileSystem);
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

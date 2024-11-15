import hxd.fmt.pak.FileSystem;
import haxe.io.Bytes;
import hxd.fs.FileEntry;
import hxd.fmt.pak.Reader;

enum FileSeekMode {
	SeekBegin;
	SeekEnd;
	SeedCurrent;
}

class RemoteFileInput extends haxe.io.BytesInput {
	public function seek(pos:Int, seekMode:FileSeekMode) {
		switch (seekMode) {
			case SeekBegin:
				this.position = pos;
			case SeekEnd:
				this.position = this.length - pos;
			case SeedCurrent:
				this.position += pos;
		}
	}

	public function tell() {
		return this.position;
	}
}

class RemoteFileSystem extends FileSystem {
	public function addRemotePak(file:RemoteFileInput, ?path:String) {
		var index = files.length;
		var info = {path: path, inputs: []};
		info.inputs[getThreadID()] = cast file;
		files.push(info);
		var pak = new Reader(file).readHeader();
		if (pak.root.isDirectory) {
			for (f in pak.root.content)
				addRec(root, f.name, f, index, pak.headerSize);
		} else
			addRec(root, pak.root.name, pak.root, index, pak.headerSize);
	}

	override public function addPak(file, ?path:String) {
		var index = files.length;
		var info = {path: path, inputs: []};
		info.inputs[getThreadID()] = file;
		files.push(info);
		var pak = new Reader(file).readHeader();
		if (pak.root.isDirectory) {
			for (f in pak.root.content)
				addRec(root, f.name, f, index, pak.headerSize);
		} else
			addRec(root, pak.root.name, pak.root, index, pak.headerSize);
	}
}

class RemotePak {
	static private var fileSystem:RemoteFileSystem = null;

	static public function addPakFromUrl(url:String, ?successCallback:FileSystem->Void, ?failCallback:String->Void) {
		// var pak = new hxd.fmt.pak.FileSystem();
		var http = new haxe.Http(url);
		http.onBytes = function(data:Bytes) {
			try {
				var f = new RemoteFileInput(data);
				#if (target.threaded && !heaps_add_pak_multithreaded)
				throw("addPak method is not designed to work in multi-threaded environment, avoid or use -D heaps_add_pak_multithreaded");
				#end
				fileSystem.addPak(cast f);
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
		trace('Requesting pak from "$url"');
		http.request();
	}

	static public function initRemotePak(?url:String, ?successCallback:FileSystem->Void, ?failCallback:String->Void) {
		fileSystem = new RemoteFileSystem();
		hxd.Res.loader = new hxd.res.Loader(fileSystem);
		if (url != null) {
			addPakFromUrl(url, successCallback, failCallback);
		}
	}
}

package hxd;

/**
 Save provides simple interface to save and load serialized user data.
 Data is serialized to String with `haxe.Serializer` and then stored in text form.
 */
/**
	
		Save provides simple interface to save and load serialized user data.
		Data is serialized to String with `haxe.Serializer` and then stored in text form.
	
**/
@:native("hxd.Save") extern class Save {
	/**
		
				Loads save with specified name. Returns `defValue` if save does not exists or could not be unserialized.
				@param defValue Fallback default save value
				@param name Name of the save
				@param checkSum Set to true if data expected to have crc checksum prepending the data. Should be set for entries saved with `checkSum = true`.
			
	**/
	static function load<T>(?defValue:T, ?name:String, ?checkSum:Bool):T;
	/**
		
				Override this method to provide custom save lookup.
				By default it uses `name + ".sav"` for system targets and `localStorage.getItem(name)` on JS.
				**Note:** This method is an utility method, to load data use `hxd.Save.load`
			
	**/
	@:noCompletion
	static function readSaveData(name:String):String;
	/**
		
				Override this method to provide custom save storage.
				By default it stores saves in `name + ".sav"` file in current working directory on system targets and `localStorage.setItem(name)` on JS.
				**Note:** This method is an utility method, to save data use `hxd.Save.save`
			
	**/
	@:noCompletion
	static function writeSaveData(name:String, data:String):Void;
	/**
		
				Deletes save with specified name.
				Override this method when using custom save lookup.
			
	**/
	static function delete(?name:String):Void;
	/**
		
				Saves `val` under the specified name.
				@param checkSum When set, save data is prepended by salted crc checksum for data validation. When save is loaded, `checkSum` flag should be set accordingly.
			
	**/
	static function save(val:Dynamic, ?name:String, ?checkSum:Bool):Bool;
}
package hxd;

/**
 The information about the dropped file.
 */
/**
	
		The information about the dropped file.
	
**/
@:native("hxd.DropFileEvent") extern class DroppedFile {
	function new(file:String):Void;
	/**
		
				The dropped file name/path.
			
	**/
	var file(default, null) : String;
	/**
		
				The native JS data transfer file.
			
	**/
	var native(default, null) : js.html.File;
	/**
		
				Retrieve the dropped file contents asynchronously and pass it to `callback`.
			
	**/
	function getBytes(callback:(data:haxe.io.Bytes) -> Void):Void;
}

/**
 The drag&drop operation event.
 
 @see `hxd.Window.addDragAndDropTarget`
 @see `hxd.Window.removeDragAndDropTarget`
 */
/**
	
		The drag&drop operation event.
	
		@see `hxd.Window.addDragAndDropTarget`
		@see `hxd.Window.removeDragAndDropTarget`
	
**/
@:native("hxd.DropFileEvent") extern class DropFileEvent {
	function new(files:Array<hxd.DropFileEvent.DroppedFile>, dx:Int, dy:Int):Void;
	/**
		
				The list of the files that were dropped.
		
				Only guaranteed to be populated when `kind == Drop`.
			
	**/
	var files(default, null) : haxe.ds.ReadOnlyArray<hxd.DropFileEvent.DroppedFile>;
	/**
		
				The first dropped file. Alias to `files[0]`.
			
	**/
	var file(get, never) : hxd.DropFileEvent.DroppedFile;
	/**
		
				The X position inside the window at which the file was dropped.
			
	**/
	var dropX(default, null) : Int;
	/**
		
				The Y position inside the window at which the file was dropped.
			
	**/
	var dropY(default, null) : Int;
}
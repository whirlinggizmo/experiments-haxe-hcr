class Entity {
	private var scripts:Map<String, ScriptInstance> = new Map(); // Holds loaded scripts by name

	public var event(default, null):EventEmitter = new EventEmitter(); // Manages events

	public var ctx:ScriptContext = ScriptContext.create(); // Holds script context

	public var id:String;

	public function new(id:Int) {
		trace('Entity $id created');
	}

	/**
	 * Attaches a script to the entity by name.
	 * The script will be loaded dynamically via ScriptLoader.
	 * 
	 * @param scriptName The name of the script to attach.
	 */
	public function attachScript(scriptName:String, callback:ScriptInstance->Void):Void {
		if (scripts.exists(scriptName)) {
			trace("Script " + scriptName + " already attached to entity");
			return;
		}
		var instance = new ScriptInstance(event);
		instance.setContext(ctx);
		instance.loadScript(scriptName, (instance) -> {
			// initialized
			// if (instance != null) {
			//	instance.ctx.HELLO = "WORLD";
			// }
		}, (instance) -> {
			// loaded
			if (instance != null) {
				// Store the script instance
				scripts.set(scriptName, instance);
				trace("Attached script: " + scriptName);

				// let the caller know the script has been loaded and attached
				callback(instance);
			} else {
				trace("Failed to attach script: " + scriptName);
				callback(null);
			}
		});
	}

	/**
	 * Detaches the script with the specified name from the entity.
	 * 
	 * @param scriptName The name of the script to detach.
	 */
	public function detachScript(scriptName:String):Void {
		var scriptInstance = scripts.get(scriptName);
		if (scriptInstance != null) {
			scriptInstance.dispose();
			scripts.remove(scriptName);
			trace("Detached script: " + scriptName);
		}
	}

	/**
	 * Invokes a method on a specific script attached to the entity.  Probably don't want to use this, emit an event instead.
	 * 
	 * @param scriptName The name of the script.
	 * @param functionName The method to invoke on the script.
	 * @param args Arguments to pass to the method.
	 */
	public function callFunction(scriptName:String, functionName:String, args:Array<Dynamic>):Dynamic {
		var scriptInstance = scripts.get(scriptName);
		if (scriptInstance != null) {
			// var method = Reflect.field(scriptInstance, functionName);
			// if (method != null) {
			//		return Reflect.callMethod(scriptInstance, method, args);
			//	} else {
			//		trace("Method " + functionName + " not found on script " + scriptName);
			//	}
			return scriptInstance.callFunction(functionName, args);
		} else {
			trace("Script " + scriptName + " not found on entity");
		}
		return null;
	}

	public function dispose():Void {
		// Detach all scripts
		for (scriptName in scripts.keys()) {
			detachScript(scriptName);
		}
	}
}

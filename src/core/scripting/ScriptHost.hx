package core.scripting;

// import core.stage.IStage;
// import core.app.IApp;
//import haxe.macro.Type.Ref;
//import core.util.TypeUtils;
import core.events.EventEmitter;
//import core.events.EventEmitterTracker;
import core.logging.Log;
import core.scripting.ScriptContext;
import core.scripting.Script;

 interface IScriptHost {
	public function dispatchEvent(eventId:String, ?eventData:Dynamic):Void ;
		public function addEventListener(eventName:String, callback:String):Void; // refer to functions by name, not function object
	public function removeEventListener(eventName:String, callback:String):Void; // refer to functions by name, not function object

	public function invoke(functionName:String, ...args:Dynamic):Dynamic;
	public function setVar(key:String, value:Dynamic):Void;
	public function getVar(key:String):Dynamic;
}

class ScriptHost implements IScriptHost{
	private var script:Script;
	// private var _ctx:ScriptContext;
	private var ctx:ScriptContext;
	private var event:EventEmitter;

	// public var event:EventEmitterTracker;
	// public var event:EventEmitter;
	public var scriptName:String;

	private var scriptDirectory:String;

	// public static var app:IApp;
	// public static var stage:IStage;

	// for dispatching events.  We reassign after loading a script
	// we could just use Reflection every time, but this is more efficient (?)
	private var dispatchEventFunc:(eventName:String, data:Dynamic)->Void;

	public function new() {
		this.scriptName = null;
		this.script = null;

		//this.dispatchEventFunc = null;
		// this.scriptDirectory = scriptDirectory;
		// this.event = new EventEmitter();
		// this.event = new EventEmitterTracker();
		// if (externalEventEmitter != null) {
		//	this.event.eventEmitter = externalEventEmitter;
		// }
		this.event = new EventEmitter();
		this.ctx = {}; // ScriptContext.create();
	}

	/*
		public function setApp(app:IApp) {
			ScriptHost.app = app;
		}

		public function setStage(stage:IStage) {
			ScriptHost.stage = stage;
		}
	 */
	// private function restoreScriptEnvironment(script:Script) {
	// 	// since scripts are single instances (essentialy singletons), we need set their instance variables before calling methods
	// 	if (script != null) {
	// 		// script.event = this.event;
	// 		script.setContext(this.ctx);
	// 		this.dispatchEventFunc = Reflect.field(script, "dispatchEvent");
	// 		script.name = this.scriptName;
	// 		// script.name = this.scriptName;
	// 		// script.app = ScriptHost.app;
	// 		// script.stage = ScriptHost.stage;
	// 		// set other instance variables here
	// 	}
	// }

	// private function saveScriptEnvironmehhhnt(script:Script) {
	// 	// since scripts are single instances (essentialy singletons), we need set their instance variables before calling methods
	// 	if (script != null) {
	// 		// this.event = script.event;
	// 		// this.ctx = script.ctx;
	// 		// this.scriptName = script.name;
	// 		// script.app = ScriptHost.app;
	// 		// script.stage = ScriptHost.stage;
	// 		// set other instance variables here
	// 	}
	// }

	public function setScriptEnvironment() {
		// since scripts are single instances (essentialy singletons), we need set their instance variables before calling methods
		if (this.script != null) {
			Reflect.setProperty(this.script, "host", this);
			Reflect.setProperty(this.script, "ctx", this.ctx);

			// this.event = script.event;
			// this.ctx = script.ctx;
			// this.scriptName = script.name;
			// script.app = ScriptHost.app;
			// script.stage = ScriptHost.stage;
			// set other instance variables here
		}
		
	}

	public function getVar(key:String):Dynamic {
		return Reflect.getProperty(this.ctx, key);
	}

	public function setVar(key:String, value:Dynamic):Void {
		/*
			// use reflection so we can set it by name
			// TODO:  Array access of Abstract?

			if (this._ctx != null) {
				this._ctx[key] = value;
		}*/
		Reflect.setProperty(this.ctx, key, value);

		// trace("set " + key + " to " + value);
		// trace (this.ctx.toString());

		/*
			//  the script context should be pointing to ours, so we can just set our value
				// update the script context 
				if (this.script != null) {
					Reflect.setProperty(this.script.ctx, key, value); 
				}
		 */
	}

	//public function setContext(ctx:ScriptContext) {
	//	this.ctx = ctx;
	//	if (this.script != null) {
	//		Reflect.setProperty(this.script, "ctx", this.ctx);
	//	}
	//}

	// public function getEventEmitter():EventEmitter {
	// 	return this.event;
	// }
	// public function setEventEmitter(e:EventEmitter) {
	// 	this.event = e;
	// 	if (this.script != null) {
	// 		Reflect.setProperty(this.script, "event", this.event);
	// 	}
	// }

	//public function getContext():ScriptContext {
	//	return this.ctx;
	//}

	public function loadScript(scriptName:String, ?onCreatedCallback:ScriptHost->Void, ?onLoadedCallback:ScriptHost->Void) {
		ScriptLoader.load(scriptName, (scriptName:String, loadedScript:Script) -> {
			var isReload = (this.script != null);
			if (loadedScript == null) {
				if (isReload) {
					// script was created before (but failed to reload)
					Log.warn("Failed to load script " + scriptName);
					if (onLoadedCallback != null) {
						onLoadedCallback(null);
					}
				} else {
					// script wasn't created before (and failed)
					Log.warn("Failed to create script " + scriptName);
					if (onCreatedCallback != null) {
						onCreatedCallback(null);
					}
				}
				return;
			}

			// Script was successfully created
			// // ensure it derives from Script (ScriptLoader does this already)
			// if (!TypeUtils.isDerivedFrom(Type.getClass(loadedScript), Script)) {
			// 	Log.error("Script " + scriptName + " does not derive from Script");
			// 	if (onCreatedCallback != null) {
			// 		onCreatedCallback(null);
			// 	}
			// 	return;
			// }

			this.scriptName = scriptName;
			//this.dispatchEventFunc = Reflect.field(loadedScript, "dispatchEvent");

			if (isReload) {
				// unload the previous script
				setScriptEnvironment();
				this.script._baseUnload();
				// saveScriptEnvironment(this.script);
				//this.script = null;

				// set the new script env and reload
				this.script = loadedScript;
				// set the new script's context and let it load any data from the previously unloaded script
				setScriptEnvironment();
				loadedScript._baseReload();
			} else {
				// first time loading this script
				// set the new script env and reload
				this.script = loadedScript;
				// set the new script's context and let it load any data from the previously unloaded script
				//restoreScriptEnvironment(loadedScript);

				if (onCreatedCallback != null) {
					onCreatedCallback(this);
				}
				setScriptEnvironment();
				loadedScript._baseLoad();
			}
			if (onLoadedCallback != null) {
				onLoadedCallback(this);
			}
		});
	}

	/*
		function emit(eventName:String, data:Dynamic) {
			if (this.script != null) {
				this.event.emit(eventName, data);
			}
		}

		function on(eventName:String, listener:Dynamic->Void) {
			if (this.script != null) {
				this.event.on(eventName, listener);
			}
		}

		function off(eventName:String, listener:Dynamic->Void) {
			if (this.script != null) {
				this.event.off(eventName, listener);
			}
		}
	 */
	public function invoke(functionName:String, ...args:Dynamic):Dynamic {
		if (this.script != null) {
			var func = Reflect.field(this.script, functionName);
			if (func != null) {
				// restoreScriptEnvironment(this.script);
				// return func(args);
				// return func.apply(this.script, args);
				// if length of args > 1, we need to spread them.  Use reflection
				setScriptEnvironment();
				return Reflect.callMethod(this.script, func, args);
			}
		}
		return null;
	}

	public function dispatchEvent(eventId:String, ?eventData:Dynamic):Void {
		this.event.emit(eventId, eventData);
		//if ((this.script != null) && (this.dispatchEventFunc != null)) {
			//setScriptEnvironment();
			//Reflect.callMethod(this.script, this.dispatchEventFunc, [eventId, eventData ?? {}]);
		//}

		//this.dispatchEventFunc(eventId, eventData);
	}

	public function addEventListener(eventId:String, callback:String) {
		// springboard so we can use strings for function names and lookup the actual function with Reflection
		var eventListener = (args:Dynamic) -> {
			var fn = Reflect.field(this.script, callback);
			if (fn != null) {
				setScriptEnvironment();
				Reflect.callMethod(this.script, fn, [args]);
			}
		}
		this.event.on(eventId, eventListener);
	}

	public function removeEventListener(eventId:String, callback:String) {
		//this.event.off(eventId, callback);
		// hmm.. the event callback is done in a closure, so we don't know what it is
		// TODO:  track the event callbacks so we can remove them?
		Log.warn("TODO: removeEventListener() not implemented");
	}

	public function dispose() {
		if (this.script != null) {
			setScriptEnvironment();
			this.script._baseUnload();
			this.script = null;
			//this.ctx = null;
			// this.event = null;
			//this.scriptName = null;
		}
	}
}

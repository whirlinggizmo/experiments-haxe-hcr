package core.scripting;

import core.logging.Log;
import core.util.TypeUtils;
import core.scripting.Script;
import core.scripting.ScriptContext;
import haxe.io.Path;

#if scriptable
import core.io.FileWatcher;
import core.io.FileWatcher.FileEvent;
import sys.FileSystem;
import sys.io.File;
import cpp.cppia.Host;
import cpp.cppia.Module;
#end

class ScriptLoader {
	private static var scriptCache:Map<String, Script> = new Map<String, Script>();
	public static var scriptDirectory:String = "./scripts/";
	#if scriptable
	private static var cppiaFileWatchers:Map<String, FileWatcher> = new Map<String, FileWatcher>();
	private static var haxeSourceFileWatchers:Map<String, FileWatcher> = new Map<String, FileWatcher>();
	#end

	private static function getClassName(scriptDirectory:String, scriptName:String):String {
		// the scriptName is the class name of the script, so replace any '.' with '/'
		var parts:Array<String> = scriptName.split('.');
		var className:String = parts[parts.length - 1];
		//Log.debug("className: " + className);
		return className;
	}

	private static function getClassPath(scriptDirectory:String, scriptName:String):String {
		// the scriptName is the class name of the script, so replace any '.' with '/'
		var parts:Array<String> = scriptName.split('.');
		// prepend the script directory
		parts.unshift(scriptDirectory);
		var classPath = Path.join(parts.slice(0, parts.length - 1));
		if (classPath.length == 0) {
			classPath = ".";
		}
		//Log.debug("classPath: " + classPath);

		return classPath;
	}

	/*
	private static function getProgramBasePath():String {
		// Get the full path to the program
		var programBasePath = FileSystem.fullPath(Sys.programPath());

		// If the program path points to a file (e.g., executable), get the directory by manipulating the string
		if (!FileSystem.isDirectory(programBasePath)) {
			programBasePath = programBasePath.split("/").slice(0, -1).join("/");
		}

		return programBasePath;
	}
	*/

	private static function createWatchers(scriptDirectory:String, scriptName:String) {
		#if scriptable
		//
		// Create a FileWatcher to monitor the script file (the .cppia file)
		//
		var scriptCppiaPath = Path.join([scriptDirectory, scriptName]); // programBasePath + "/" + scriptDirectory;
		scriptCppiaPath = Path.normalize(scriptCppiaPath);

		scriptDirectory = scriptDirectory ?? "";

		// remove any existing cppia file watchers
		if (cppiaFileWatchers.exists(scriptName)) {
			cppiaFileWatchers[scriptName].stop();
			cppiaFileWatchers.remove(scriptName);
		}

		// break the scriptName into the package name and class name
		var className = getClassName(scriptDirectory, scriptName);
		var scriptCppiaFile = className + ".cppia";
		var scriptCppiaPath = getClassPath(scriptDirectory, scriptName);
		scriptCppiaPath = Path.join([Sys.getCwd(), scriptCppiaPath]); // programBasePath + "/../" + scriptDirectory;

		var cppiaFileWatcher = new FileWatcher(scriptCppiaPath, scriptCppiaFile, (filename:String, event:FileEvent) -> {
			// wait for the file to be closed
			// Timer.delay(function() {


			//if (filename != scriptCppiaFile) {
			//	Log.warn("Script file different path than expected!: " + filename + " != " + scriptCppiaFile);
			//	return;
			//}

			if (event != FileEvent.Modified) {
				return;
			}
			// TODO: Handle the case where the file is deleted
			if (event == FileEvent.Removed) {
				Log.fatal("Script file deleted, unable to reload: " + filename);
				return;
			}

			Log.info("Reloading script file: " + filename);
			var savedContext:ScriptContext = ScriptContext.create();
			var script = ScriptLoader.scriptCache.get(scriptName);
			if (script != null) {
				var unloadFunc = Reflect.field(script, '_baseUnload');
				if (unloadFunc != null) {
					Reflect.callMethod(script, unloadFunc, []);
				}

				// save the context before unloading
				savedContext = Reflect.field(script, 'ctx');
			}
			script = createScriptInstance(scriptDirectory, scriptName);
			if (script != null) {
				// save the new instance
				if (ScriptLoader.scriptCache.exists(scriptName)) {
					ScriptLoader.scriptCache.remove(scriptName);
				}
				ScriptLoader.scriptCache.set(scriptName, script);

				// restore the context before reloading
				Reflect.setField(script, 'ctx', savedContext);
				var reloadFunc = Reflect.field(script, '_baseReload');
				if (reloadFunc != null) {
					Reflect.callMethod(script, reloadFunc, []);
				}
			} else {
				Log.error("Failed to reload script file: " + scriptName);
			}
			// },1000);
		});

		cppiaFileWatcher.start();
		cppiaFileWatchers.set(scriptName, cppiaFileWatcher);

		//
		// Create a FileWatcher to recompile script file changes (.hx -> .cppia)
		//
		// remove any existing haxe source file watchers
		if (haxeSourceFileWatchers.exists(scriptName)) {
			haxeSourceFileWatchers[scriptName].stop();
			haxeSourceFileWatchers.remove(scriptName);
		}

		// break the scriptName into the package name and class name
		var className = getClassName(scriptDirectory, scriptName);
		var scriptSourceFile = className + ".hx";
		//var scriptSourcePath = getClassPath(scriptDirectory, scriptName);

		// TODO:  THIS IS SOOPER HACKY!
		// Use env variables to get the source paths for scripts and main .hx files?
		// An environment variable that points to generate.cppia.hxml?
		var scriptSourcePathEnv = Sys.getEnv("SCRIPT_SOURCE_PATH");
		var scriptSourcePath = scriptSourcePathEnv ?? Path.join([Sys.getCwd(), "..", "..", scriptDirectory]); // programBasePath + "/../" + scriptDirectory;
		
		var mainSourcePathEnv = Sys.getEnv("MAIN_SOURCE_PATH");
		var mainSourcePath = mainSourcePathEnv ?? Path.join([Sys.getCwd(), "..", "..", "src"]); // programBasePath + "/../" + scriptDirectory;

		scriptSourcePath = Path.normalize(scriptSourcePath);
		mainSourcePath = Path.normalize(mainSourcePath);

		Log.info("Source path for script files(.hx) files is: " + scriptSourcePath);
		Log.info("Source path for main files (.hx) files is: " + mainSourcePath);


		var scriptSourceFile = className + ".hx";

		var haxeSourceFileWatcher = new FileWatcher(scriptSourcePath, scriptSourceFile, (filename:String, event:FileEvent) -> {
			//var programBasePath = getProgramBasePath();
			Log.debug("Recompiling script file: " + filename);
			//Log.debug("Program path: " + programBasePath);
			//Log.debug("Script source path: " + scriptSourcePath);
			//Log.debug("Source file: " + scriptSourceFile);

			//Log.debug("Main source path: " + mainSourcePath);

			//Log.debug("Script output path: " + scriptCppiaPath);
			//Log.debug("Script output file: " + scriptCppiaFile);

			Sys.command("haxe", [
				//"--debug",
				//"-dce",
				//"no",
				//"-lib",
				//"hxcpp-debugger",
				//"-lib",
				//"hxcpp-debug-server",
				"-cp",
				'${mainSourcePath}',
				"-cp",
				'${scriptSourcePath}',
				'${scriptName}',
				"-cppia",
				'${scriptCppiaPath}/${scriptCppiaFile}'
			]);
		});
		haxeSourceFileWatcher.start();
		haxeSourceFileWatchers.set(scriptName, haxeSourceFileWatcher);
		#end
	}

	private static function createScriptInstance(scriptDirectory:String, className:String):Script {
		try {
			var resolvedClass = null;
			#if scriptable

			var scriptRuntimeDirectoryEnv = Sys.getEnv("SCRIPT_RUNTIME_PATH");
			scriptDirectory = scriptRuntimeDirectoryEnv ?? scriptDirectory;

			// check for the base script directory
			if (!FileSystem.exists(scriptDirectory)) {
				// Path.(scriptDirectory);
				var scriptAbsoluteDirectory = Path.join([Sys.getCwd(), scriptDirectory]);
				Log.error("Script directory not found: " + scriptAbsoluteDirectory);
				return null;
			}

			// Load the code from cppia file
			var sourceFilePath = Path.join([scriptDirectory, className + ".cppia"]);
			sourceFilePath = Path.normalize(sourceFilePath);
			if (!FileSystem.exists(sourceFilePath)) {
				Log.warn("Script file not found: " + sourceFilePath);
				return null;
			}

			// create the module from the source file (.cppia)
			var source = sys.io.File.getBytes(sourceFilePath);
			var module = Module.fromData(source.getData());
			module.boot();
			module.run(); // call main, if it exists?

			// Log.debug("Module: " + module);
			// Log.debug("Fields: " + fields);
			// Log.debug("Resolving class: " + scriptDirectory + '.' + className);
			var resolvedClass:Class<Script> = cast module.resolveClass(className);
			// Log.debug("Class: " + this.scriptClass);
			#else
			var resolvedClass:Class<Script> = cast Type.resolveClass(className);
			#end

			if (resolvedClass == null) {
				Log.debug("Failed to find class for: " + className);
				return null;
			}

			// make sure the class is derived from Script
			if (!TypeUtils.isDerivedFrom(resolvedClass, Script)) {
				Log.error('Class $className is derived from Script');
				return null;
			}

			// create an instance of the class
			var script:Script = cast Type.createInstance(resolvedClass, []);
			if (script == null) {
				Log.debug("Failed to create instance of class: " + className);
				return null;
			}

			Reflect.setField(script, 'name', className);

			// var fields = Type.getInstanceFields(Type.getClass(scriptHost));
			// var methods = fields.filter(field -> Reflect.isFunction(Reflect.field(scriptHost, field)));
			// Log.debug("Methods: " + methods.join(", "));

			return script;
		} catch (e:Dynamic) {
			Log.debug("Unable to load script file: " + Std.string(e));
			return null;
		}
	}

	/*
		private static function _load(scriptDirectory:String, scriptName:String, onLoaded:Script->Void):Void {
			// the scriptName is the class name of the script, so replace any '.' with '/'
			scriptName = StringTools.replace(scriptName, '.', '/'); // scriptName.replace('.', '/');

			var scriptPath = scriptDirectory + '/' + scriptName + '.js' + "?hotreload-cachebuster=" + Std.string(Date.now().getTime());

			var instance = createScriptInstance(scriptName);

			if (instance != null) {
				onLoaded(instance);
				return;
			} else {
				Log.debug("Failed to load script: " + scriptPath);
				onLoaded(null);
				return;
			}
		}
	 */
	public static function load(scriptDirectory:String, scriptName:String, onLoaded:String->Script->Void):Void {
		var previousScript = scriptCache.get(scriptName);

		if (scriptCache.exists(scriptName)) {
			onLoaded(scriptName, scriptCache.get(scriptName));
			return;
		}

		// this.className = scriptName;

		// TODO: do we want to include the script directory as the package, or add the script directory class path when building?
		// var fullScriptName = scriptDirectory + '.' + scriptName;
		// var fullScriptName = scriptName;

		var script = createScriptInstance(scriptDirectory, scriptName);

		// _load(scriptDirectory, scriptName, (scriptHost) -> {
		if (script != null) {
			// create the watcher.  Do this before registering the script so the watcher will know it's the first load
			createWatchers(scriptDirectory, scriptName);
			// cache the script 
			scriptCache.set(scriptName, script);
			onLoaded(scriptName, script);
		} else {
			Log.error('Error loading script: ' + scriptDirectory + '/' + scriptName);
			onLoaded(scriptName, null);
		}
		// });
		return;
	}
}

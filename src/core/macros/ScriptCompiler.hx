package core.macros;

import sys.FileSystem;
import haxe.io.Path;
import core.logging.Log;
import sys.io.File;
import sys.io.FileOutput;

// A script generator that generates "script" files from .hx files
// hxml can't do variables, so we use this "script"
// Usage:
// haxe --run ScriptCompiler --scriptDir scripts --scriptName Test --extension cppia --outputDir bin/cppia/scripts
class ScriptCompiler {
	public static function compileScriptInternal(rootDir:String, sourceDir:String, className:String, outputDir:String, extension:String):Void {
		rootDir = Path.normalize(rootDir);
		sourceDir = Path.normalize(sourceDir);
		outputDir = Path.normalize(outputDir);

		if (StringTools.startsWith(extension, ".")) {
			extension = extension.substring(1);
		}

		// convert package's '.' to '/' for the filename
		var classNameAsPath = StringTools.replace(className, ".", "/");
		var classPath = new Path(classNameAsPath);
		var packagePath = classPath.dir ?? "";
		var outputFileName = classPath.file + '.' + extension;
		var outputFileDir = Path.join([rootDir, outputDir, packagePath]);
		var outputFilePath = Path.join([outputFileDir, outputFileName]);
		var hxFilePath = Path.join([rootDir, sourceDir, classNameAsPath + ".hx"]);

		Log.info('Compiling class: ${className}');
		Log.info("Source file: " + hxFilePath);
		Log.info("Output file: " + outputFilePath);

		// ensure the source path is a valid haxe file
		if (!FileSystem.exists(hxFilePath)) {
			Log.error("Class file not found: " + hxFilePath);
			return;
		}

		// create the output directory
		if (!FileSystem.exists(outputFileDir)) {
			FileSystem.createDirectory(outputFileDir);
		}

		Sys.command("haxe", [
			"hxml/common.hxml",
			"--debug",
			"-dce",	
			"no",

			// cpp
			//"-lib",
			//"hxcpp-debug-server",

			//js
			"-D", "source-map-content",
			"-D","source-map",
			"-D", "enable-script-reload",

			'-${extension}',
			'${outputFilePath}',
			'${className}'
		]);

		return;
	}

	static var ignoredFiles = ["import.hx"];
	static var ignoredDirectories = ["unused", "externs"];
	static var ignoredFilesRegex = new EReg(ignoredFiles.join("|"), "i");
	static var ignoredDirectoriesRegex = new EReg(ignoredDirectories.join("|"), "i");

	static function isIgnored(file:String, ignoreRegexes:Array<EReg>):Bool {
		for (regex in ignoreRegexes) {
			if (regex.match(file)) {
				return true;
			}
		}
		return false;
	}

	static function getFilesRecursive(directory:String = "path/to/"):Array<String> {
		var files:Array<String> = [];

		if (sys.FileSystem.exists(directory)) {
			if (isIgnored(directory, [ignoredDirectoriesRegex])) {
				return files;
			}
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					if (!isIgnored(file, [ignoredFilesRegex])) {
						files.push(path);
					}
				} else {
					var subdirectory = haxe.io.Path.addTrailingSlash(path);
					files = files.concat(getFilesRecursive(subdirectory)); // Add files from subdirectory
				}
			}
		} else {
			trace('"$directory" does not exist');
		}

		return files;
	}

	macro static public function generateScriptsList(scriptsDir:String = 'scripts', outputFileName:String):Void {
		// trace("Generating scripts list...");

		var files:Array<String> = getFilesRecursive(scriptsDir);

		if (files == null) {
			trace("No scripts found in " + scriptsDir);
			return;
		}

		// filter out to just the .hx files
		files = files.filter(function(file) {
			return StringTools.endsWith(file, ".hx");
		});

		// ensure the output directory exists
		if (!FileSystem.exists(Path.directory(outputFileName))) {
			FileSystem.createDirectory(Path.directory(outputFileName));
		}
		var f = File.write(outputFileName, false);
		f.writeString("#####################################\n");
		f.writeString('# Auto generated scripts list from ${scriptsDir}\n');
		f.writeString("# Total scripts: " + files.length + "\n");
		f.writeString("#####################################\n");
		f.writeString("\n");
		for (fileName in files) {
			// strip the scriptsDir directory from the file name
			fileName = fileName.substring(scriptsDir.length + 1);
			// strip the .hx extension
			fileName = fileName.substring(0, fileName.length - 3);
			// replace slashes with dots
			fileName = fileName.split("/").join(".");
			f.writeString(fileName + "\n");
			// trace("Added script to list: " + fileName);
		}
		f.close();
	}

	static function getClassNamesFromArgs():Array<String> {
		var args = Sys.args();
		var classNames:Array<String> = [];
		var i = args.length - 1; // Start at the end so we don't cause problems when we remove arguments

		var singleNameFlagList = ['-debug', '--debug'];

		while (i >= 0) {
			if (singleNameFlagList.contains(args[i].toLowerCase())) {
				// remove single name flags (like --debug)
				args.splice(i, 1);
			} else if (StringTools.startsWith(args[i], "-")) {
				// remove any flags that start with '-' (includes '--') (should have two values, like '-cp src', '--lib mylib' )
				args.splice(i, 2);
			}

			i--;
		}

		// Any remaining arguments are script names
		for (j in args) {
			classNames.push(j);
		}

		return classNames;
	}

	macro static public function compileScript(scriptsDir:String = 'scripts', outputDir:String = 'gen', extension:String = "js"):Void {
		if (extension == null || extension.length == 0) {
			extension = "js";
		}
		// strip any preceding '.' from the extension
		if (StringTools.startsWith(extension, ".")) {
			extension = extension.substring(1);
		}

		if (outputDir == null || outputDir.length == 0) {
			outputDir = "gen";
		}

		// get the class name from the args
		var classNames = getClassNamesFromArgs();

		if (classNames.length < 1) {
			Log.error("No class name(s) specified");
			return;
		}

		for (className in classNames) {
			// trace('className: ' + className);
			compileScriptInternal(Sys.getCwd(), scriptsDir, className, outputDir, extension);
		}
	}

	macro static public function compileScripts(scriptsDir:String = 'scripts', outputDir:String = 'gen', extension:String = "js"):Void {
		if (extension == null || extension.length == 0) {
			extension = "js";
		}
		// strip any preceding '.' from the extension
		if (StringTools.startsWith(extension, ".")) {
			extension = extension.substring(1);
		}

		if (outputDir == null || outputDir.length == 0) {
			outputDir = "gen";
		}
		var files = getFilesRecursive(scriptsDir);

		// only include .hx files
		files = files.filter(function(file) {
			return StringTools.endsWith(file, ".hx");
		});

		for (fileName in files) {
			// strip the scriptsDir directory from the file name
			fileName = fileName.substring(scriptsDir.length + 1);
			// strip the .hx extension
			fileName = fileName.substring(0, fileName.length - 3);
			// replace slashes with dots
			fileName = fileName.split("/").join(".");

			compileScriptInternal(Sys.getCwd(), scriptsDir, fileName, outputDir, extension);
		}
	}

	public static function main() {
		Log.setLevel(LogLevel.Info);
		Log.debug("ScriptCompiler starting");
		Log.rawOutput = true;
		// var programBasePath = FileSystem.fullPath(Sys.programPath());
		// var path = new haxe.io.Path(location);
		var rootDir = Sys.getCwd();
		// Log.debug("Program path: " + programBasePath);

		var sourceDirectory = "scripts";
		var classNames = [];
		var outputDirectory = "";
		var extension = "js";

		var args = Sys.args();
		var i = args.length - 1; // Start at the end so we don't cause problems when we remove arguments

		while (i >= 0) {
			if ((args[i] == "-src") || args[i] == "--sourceDir") {
				sourceDirectory = args[i + 1];
				args.splice(i, 2);
			} else if ((args[i] == "-class") || (args[i] == "--className")) {
				classNames.push(args[i + 1]);
				args.splice(i, 2);
			} else if ((args[i] == "-out") || (args[i] == "--outputDir")) {
				outputDirectory = args[i + 1];
				args.splice(i, 2);
			} else if ((args[i] == "-root") || (args[i] == "--rootDir")) {
				rootDir = args[i + 1];
				args.splice(i, 2);
			} else if ((args[i] == "-ext") || (args[i] == "--extension")) {
				extension = args[i + 1];
				args.splice(i, 2);
			} else if ((args[i] == "-js") || (args[i] == "--javascript") || (args[i] == "--js")) {
				extension = "js";
				args.splice(i, 1);
			} else if ((args[i] == "-cppia") || (args[i] == "--cppia") || (args[i] == "--cppia")) {
				extension = "cppia";
				args.splice(i, 1);
			}

			if (StringTools.startsWith(args[i], "-")) {
				Log.error("Unknown argument: " + args[i]);
				return;
			}

			i--;
		}

		// Any remaining arguments are script names
		for (j in args) {
			classNames.push(j);
		}

		if (classNames.length == 0) {
			Log.error("Please specify a class name (e.g. [--className | -class] MyClass). The class name should include the package name (e.g. entities.Guardsman)");
			return;
		}

		if (outputDirectory.length == 0) {
			Log.error("Please specify an output directory (e.g. [--outputDir | -out] bin/cppia/scripts). The class name should include the package name (e.g. entities.Guardsman)");
			return;
		}

		// remove leading . if it was included in the extension
		if (StringTools.startsWith(extension, ".")) {
			extension = extension.substring(1);
		}

		for (className in classNames) {
			Log.info('Compiling ${Path.join([sourceDirectory, className + ".hx"])} to ${Path.join([outputDirectory, className + "." + extension])}...');
			ScriptCompiler.compileScriptInternal(rootDir, sourceDirectory, className, outputDirectory, extension);
		}

		Log.debug("ScriptCompiler finished");
	}
}

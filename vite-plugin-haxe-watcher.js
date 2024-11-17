import { exec } from 'child_process';
import path, { resolve } from 'path';
import fs from 'fs';

let options = {};

// Helper to get all Haxe files from a directory (recursively)
function getHaxeFiles(dir, fileList = []) {
    const files = fs.readdirSync(dir);
    files.forEach(file => {
        const filePath = resolve(dir, file);
        if (fs.statSync(filePath).isDirectory()) {
            fileList = getHaxeFiles(filePath, fileList);
        } else if (file.endsWith('.hx')) {
            fileList.push(filePath);
        }
    });
    return fileList;
}

// Compile the main files
let isCompilingMain = false;
async function compileMain() {
    if (isCompilingMain) {
        console.log('Already compiling main, skipping...');
        return;
    }
    isCompilingMain = true;
    return new Promise((resolve, reject) => {
        const cmd = `${options.haxeExecutable} ${options.hxmlMain} -${options.outputTarget} ${path.join(options.outputDir, options.outputTarget, options.outputFile)}`;
        console.log(`Compiling main with command: ${cmd}`);
        exec(cmd, (err, stdout, stderr) => {
            isCompilingMain = false;
            if (err) {
                //console.error(err.message);
                return reject(stderr);
            }
            console.log(`Compiled main: ${path.join(options.outputDir, options.outputTarget, options.outputFile)}`);

            resolve(stdout);
        });
    });
}

// Compile a single script
async function compileScript(relativeScriptName) {
    return new Promise((resolve, reject) => {
        if (!relativeScriptName || !relativeScriptName.endsWith('.hx')) {
            return reject(`Invalid or missing script name: ${relativeScriptName}`);
        }

        const className = relativeScriptName.split('/').pop().slice(0, -3);
        const classPath = relativeScriptName.split(`${options.scriptsDir}/`).pop().slice(0, -3).replace(/\//g, '.');
        const outputName = relativeScriptName.slice(0, -3) + `.${options.outputTarget}`;
        const cmd = `${options.haxeExecutable} ${options.hxmlScript} -${options.outputTarget} ${path.join(options.outputDir, options.outputTarget, outputName)} ${classPath}`;
        console.log(`Compiling script with command: ${cmd}`);
        exec(cmd, (err, stdout, stderr) => {
            if (err) {
                return reject(`Failed to compile script ${relativeScriptName}: ${stderr}`);
            }
            console.log(`Compiled script: ${relativeScriptName}`);
            resolve(stdout);
        });
    });
}

// Compile main and all scripts
async function compileAll() {
    try {
        await compileMain();
        const haxeFiles = getHaxeFiles(options.scriptsDir);
        await Promise.all(haxeFiles.map(haxeFile => {
            const relativePath = path.relative(__dirname, haxeFile);
            return compileScript(relativePath);
        }));
    } catch (e) {
        console.error(e);
    }
}

function cleanOutputDir() {
    return new Promise((resolve, reject) => {
        const cmd = `rm -rf ${options.outputDir}/*`;
        console.log(`Cleaning output directory with command: ${cmd}`);
        exec(cmd, (err, stdout, stderr) => {
            if (err) {
                return reject(stderr);
            }
            console.log(`Cleaned output directory: ${options.outputDir}`);
            resolve(stdout);
        });
    });
}

export function haxe(opts = {}) {
    options = {
        haxeExecutable: 'haxe',
        sourceDir: 'src',
        scriptsDir: 'scripts',
        outputDir: 'out',
        outputTarget: 'js',
        outputFile: 'main.js',
        hxmlScript: 'script.hxml',
        hxmlMain: 'main.hxml',
        ...opts
    };

    console.log('Haxe options:', options);

    options.sourceDir = options.sourceDir.replace(/\/$/, '');
    options.scriptsDir = options.scriptsDir.replace(/\/$/, '');
    options.outputDir = options.outputDir.replace(/\/$/, '');


    return {
        name: 'haxe',
        apply: 'serve',
        async handleHotUpdate({ file, server, modules }) {
            const relativePath = path.relative(__dirname, file);
            const isInHaxeSrc = file.startsWith(options.sourceDir) && file.endsWith('.hx');
            const isInScripts = file.startsWith(options.scriptsDir) && file.endsWith('.hx');
            const isHXML = (relativePath == options.hxmlMain) || (relativePath == options.hxmlScript);
            //console.log(`Change detected for: ${relativePath}`);

            //console.log('isInHaxeSrc:', isInHaxeSrc);
            //console.log('isInScripts:', isInScripts);
            //console.log('isHXML:', isHXML);

            if (isHXML) {
                console.log(`HXML file ${relativePath} changed, recompiling all...`);
                try {
                    await compileAll();
                    const mainModuleId = path.resolve(__dirname, options.outputDir, options.outputTarget, options.outputFile);
                    return [server.moduleGraph.getModuleById(mainModuleId)];
                } catch (e) {
                    console.error(e);
                }
                return [];
            }

            // We are only interested in .hx files changing, (not the outputted .js files).
            // When a .hx file has changed, compile it.  If it's from the main src group, tell vite the resulting .js module has changed.
            // In the case of scripts, we dispatch a message to the app, notifiying it to reload the compiled script.
            if (isInHaxeSrc) {
                try {
                    await compileMain();
                    // We don't send a manual full-reload, vite will reload when the main module is updated
                    // console.log(`Sending 'full-reload' message for: ${relativePath}`);
                    //server.ws.send({ type: 'full-reload', path: '*' });
                    const mainModuleId = path.resolve(__dirname, options.outputDir, options.outputTarget, options.outputFile);
                    return [server.moduleGraph.getModuleById(mainModuleId)];
                } catch (e) {
                    console.error(e);
                }

            } else if (isInScripts) {
                //console.log(`Hot reloading script: ${relativePath}`);
                try {
                    await compileScript(relativePath);
                    // Note that we are ntentionally not adding this module to the list of modules to reload.  Instead, send a message to the app so it can handle it (scripts)
                    //const moduleId = path.resolve(__dirname, options.outputDir, relativePath.slice(0, -3) + '.js');
                    //const changedModule = server.moduleGraph.getModuleById(moduleId);
                    //return [changedModule];
                    console.log(`Sending 'hotreload' message for: ${relativePath}`);
                    server.ws.send({
                        type: 'custom',
                        event: 'hotreload',
                        data: { msg: relativePath },
                    });
                } catch (e) {
                    console.error(e);
                }
                return []; // Don't hmr the module in the browser, we send a message to the app instead
            }

            //console.log('Modules to reload:', modulesToReload);
            return modules;
        },
        async configureServer(server) {
            if (server.watcher) {
                server.watcher.options = {
                    ...server.watcher.options,
                    ignored: [
                        ...server.watcher.options.ignored,
                        //'**/node_modules/**',
                        path.resolve(__dirname, 'dist') + "/**",
                        // Ignore the output directory, we don't want to watch the .js files (we watch .hx files that generate the .js)
                        path.resolve(__dirname, options.outputDir, options.outputTarget) + "/**",
                    ],
                };
                server.watcher.add(options.sourceDir + "/**/*.hx");  // Watch the source directory for changes
                server.watcher.add(options.scriptsDir + "/**/*.hx"); // Watch the scripts directory for changes
            }

            try {
                console.log('Running initial compilation of main and scripts...');
                //await cleanOutputDir();
                await compileAll();  // Server start is deferred until all files are compiled
            } catch (e) {
                console.error('Error during initial compilation:', e);
            }
        }
    };
}

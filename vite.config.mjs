import { defineConfig, createLogger } from 'vite';
//import { exec } from 'child_process';
import path from 'path';
import fs from 'fs';
import os from 'os';
import { haxe } from './vite-plugin-haxe-watcher.js';
import viteRestart from 'vite-plugin-restart';
import { visualizer } from 'rollup-plugin-visualizer';


// Use the dotenv package to load environment variables from a .env file
// We fallback to the default keys directory if KEYS_DIR is not set
// Exit if the private key or certificate files are missing
import dotenv from 'dotenv';
dotenv.config();
let keysDir = process.env.KEYS_DIR;

if (!keysDir) {
  keysDir = `${os.homedir()}/keys/${os.hostname()}`;
  console.log(`KEYS_DIR not set in env, defaulting to ${keysDir}`);
}
if (!fs.existsSync(keysDir)) {
  console.log(`${keysDir} does not exist.`);
  exit(1);
}
const privkeyPath = path.join(keysDir, 'privkey.pem');
if (!fs.existsSync(privkeyPath)) {
  console.log(`Private key not found: ${privkeyPath}`);
  exit(1);
}
const certPath = path.join(keysDir, 'cert.pem');
if (!fs.existsSync(certPath)) {
  console.log(`Certificate not found: ${certPath}`);
  exit(1);
}
//

/*
// TODO: separate this into its own plugin file, passing in the values as options
// Define paths
const haxeSrcPath = path.resolve(__dirname, 'src');
const haxeScriptsPath = path.resolve(__dirname, 'scripts');
const haxeOutputDir = path.resolve(__dirname, 'out');
const mainJsFile = path.resolve(haxeOutputDir, 'main.js');

const hxmlCommon = path.resolve(__dirname, 'build.common.hxml');
const hxmlCore = path.resolve(__dirname, 'build.js.hxml');

// Helper to get all Haxe files from a directory (recursively)
const getHaxeFiles = (dir, fileList = []) => {
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
};

// Compile the core files
function compileCore() {
  return new Promise((resolve, reject) => {
    const cmd = `haxe ${hxmlCore}`;
    //console.log(`Compiling core with command: ${cmd}`);
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        console.error(`Haxe build error: ${stderr}`);
        return reject(stderr);
      } else {
        console.log(`${stdout}`);
        return resolve(stdout);
      }
    });
  });
}

// Compile a single script by using the common hxml and adding the script to the command line
function compileScript(relativeScriptName) {
  return new Promise((resolve, reject) => {
    if (!relativeScriptName || !relativeScriptName.endsWith('.hx')) {
      return reject('Invalid or missing script name');
    }

    const className = relativeScriptName.split('/').pop().slice(0, -3);
    const classPath = relativeScriptName.split('scripts/').pop().slice(0, -3).replace(/\//g, '.');
    const outputName = relativeScriptName.slice(0, -3) + '.js';
    const cmd = `haxe ${hxmlCommon} --js ${haxeOutputDir}/${outputName} ${classPath}`;

    //console.log(`Compiling script with command: ${cmd}`);
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        console.error(`Failed to compile script ${className} (${relativeScriptName}): ${stderr}`);
        return reject(stderr);
      }
      console.log(`Compiled script: ${className} (${relativeScriptName})`);
      return resolve(stdout);
    });
  });
}
*/

//const haxeSrcPath = path.resolve(__dirname, 'src');
//const haxeScriptsPath = path.resolve(__dirname, 'scripts');
//const haxeOutputDir = path.resolve(__dirname, 'out');

// custom logger to supress the dynamic import warning.  We could modify the js.Lib.import function instead, but that would veer from stock
const logger = createLogger();
const originalWarn = logger.warn;
logger.warn = (message, options) => {
  // suppress the dynamic import warning
  if (message.includes('The above dynamic import cannot be analyzed by Vite')) {
    return;
  }
  originalWarn(message, options);
}

const outputTarget = 'js';
const srcDir = 'src';
const scriptsDir = 'scripts';
const outputDir = 'out';
const outputFile = 'index.js';
const hxmlScript = 'hxml/script.hxml';
const hxmlMain = 'hxml/main.hxml';


export default defineConfig({
  base: '', // defaults to /, '' makes it relative
  //root: '.', // defaults to process.cwd()
  define: {
    CONFIG_ENV: JSON.stringify(process.env.CONFIG_ENV)
  },
  customLogger: logger,
  plugins: [
    haxe({
      sourceDir: srcDir,
      scriptsDir: scriptsDir,
      outputDir: outputDir,
      outputTarget: outputTarget,
      outputFile: outputFile,
      hxmlScript: hxmlScript,
      hxmlMain: hxmlMain,
    }),
    viteRestart({
      restart: [
        'public/**',
        'res/**/*.fbx'
      ],
      reload: [
        'public/**',
      ]
    }),
  ],
  build: {
    outDir: 'dist',
    copyPublicDir: true,
    assetsDir: '.',
    sourcemap: false,
    emptyOutDir: true,
    target: 'esnext',
    rollupOptions: {
      plugins: [
        /*
        visualizer({
          openOptions: {
            app: {
              name: '/usr/bin/brave-browser'
            }
          },
          template: 'treemap',
          emitFile: false,
          open: true,
          gzipSize: true,
          brotliSize: true
        })
        */
      ],
      output: {
        entryFileNames: '[name].js',
        chunkFileNames: '[name].js',
      }
    },

  },
  server: {
    host: '0.0.0.0',
    port: 4444,
    strictPort: true,
    open: false,
    https: {
      key: fs.readFileSync(privkeyPath),
      cert: fs.readFileSync(certPath)
    },
  },
});

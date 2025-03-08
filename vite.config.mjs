import { defineConfig, createLogger, searchForWorkspaceRoot } from 'vite';
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
  process.exit(1);
}
const privkeyPath = path.join(keysDir, 'privkey.pem');
if (!fs.existsSync(privkeyPath)) {
  console.log(`Private key not found: ${privkeyPath}`);
  process.exit(1);
}
const certPath = path.join(keysDir, 'cert.pem');
if (!fs.existsSync(certPath)) {
  console.log(`Certificate not found: ${certPath}`);
  process.exit(1);
}
//

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
const srcDirs = ['src', 'hxml'];
const scriptsDir = 'scripts';
const outputDir = 'out';
const outputFile = 'index.js';
//const hxmlScript = 'hxml/script.hxml';
const hxmlScript = 'hxml/build.script.hxml';
const hxmlMain = 'hxml/main.hxml';
//const hxmlMain = 'hxml/build.js.hxml';

console.log('Resolved out path:', path.resolve(__dirname, 'out'));
console.log(searchForWorkspaceRoot(process.cwd()));

export default defineConfig({
  base: '', // defaults to /, '' makes it relative
  root: 'html', // defaults to process.cwd()
  appType: 'mpa', // don't want history fallback, return 404's  
  define: {
    CONFIG_ENV: JSON.stringify(process.env.CONFIG_ENV)
  },
  customLogger: logger,
  plugins: [
    
    haxe({
      sourceDirs: srcDirs,
      scriptsDir: scriptsDir,
      outputDir: outputDir,
      outputTarget: outputTarget,
      outputFile: outputFile,
      hxmlScript: hxmlScript,
      hxmlMain: hxmlMain,
    }),
    
    viteRestart({
      restart: [
        //'public/**',
        //'res/**/*.fbx'
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
    sourcemap:true
  },
  resolve: {
    alias: {
      '/out': path.resolve(__dirname, 'out')
    }
  },
});

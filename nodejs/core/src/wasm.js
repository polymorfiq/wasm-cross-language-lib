const fs = require('fs');
const modData = fs.readFileSync('./vendor/lib_core.wasm');
const imports = {
  env: {respond: (a, b) => {}}
};

module.exports.wasmPromise = WebAssembly.instantiate(new Uint8Array(modData), imports)
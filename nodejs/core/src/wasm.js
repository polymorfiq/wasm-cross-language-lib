const fs = require('fs');
const modData = fs.readFileSync('./vendor/lib_core.wasm');
const imports = {
  env: {report_log: (addr, length) => {}}
};

module.exports.wasmPromise = WebAssembly.instantiate(new Uint8Array(modData), imports)
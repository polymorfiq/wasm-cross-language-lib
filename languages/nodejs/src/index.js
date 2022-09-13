const fs = typeof window === 'object'
    ? null
    : eval('require("fs")')

class MyLib {
    constructor(module) {
        this.module = module;
        this.instance = module.instance;
    }

    multiply_by_two(num) {
        return this.instance.exports.multiply_by_two(num)
    }

    test_log(msg) {
        const utf8_encoded = new TextEncoder().encode(msg);
        let strAddr = this.instance.exports.alloc_utf8_log(utf8_encoded.length);

        const memView = new Uint8Array(this.instance.exports.memory.buffer);
        memView.set(utf8_encoded, strAddr);
        this.instance.exports.flush_utf8_logs();
    }
}

MyLib.load = function(wasm) {
    if (!MyLib._wasm) {
        const fetchWasm = wasm || fs.promises.readFile(`${__dirname}/vendor/wasm.wasm`).then((r) => new Uint8Array(r));
        MyLib._wasm = fetchWasm.then((modData) => {
            return WebAssembly.instantiate(modData, {
                env: {
                    report_log: MyLib.report_log
                }
            })
        });
    }

    return MyLib._wasm.then((module) => {
        MyLib.module = module;
        MyLib.instance = module.instance;
        return new MyLib(module);
    })
};

MyLib.report_log = function(addr, length) {
    const memView = new Uint8Array(MyLib.instance.exports.memory.buffer);
    const strBytes = memView.subarray(addr, addr + length);
    const str = new TextDecoder().decode(strBytes);

    MyLib.log(str);
};

MyLib.log = function(msg) {
    console.log(`WASM Log: ${msg}`);
};
 
module.exports = MyLib;
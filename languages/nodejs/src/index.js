const { wasmPromise } = require('./wasm');

class MyLib {
    constructor(instance) {
        this.instance = instance;
    }

    multiply_by_two(num) {
        return this.instance.exports.multiply_by_two(num)
    }
}

MyLib.new = function() {
    return wasmPromise.then((module) => {
        return new MyLib(module.instance);
    })
};
 
module.exports.MyLib = MyLib;
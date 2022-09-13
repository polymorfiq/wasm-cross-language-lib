This is a repository for me to test out building a multi-language library via WebAssembly!

### lib/
Contains the main bulk of Rust code. Has no WASM-specific details, for easier testability and reusability.

### languages/
Contains various languages that can use the WASM binary for their shared backend logic

### wasm/
Contains the WASM code - depends on `lib` - details **imports** and **exports** for the WASM.

## Building & Testing
In general, you can checkout [build.sh](./build.sh) for details on building the binary and [test.sh](./test.sh) for details on running tests across the various languages.

You can also checkout **[deployed.wat](./deployed.wat)** to see a **human-readable version of the library's current WASM!**

Example:
```
// First, build the WASM library
cd wasm;
cargo build --release;
cd ..;

// To use it in Elixir...
cp wasm/target/wasm32-unknown-unknown/release/wasm.wasm languages/elixir/priv/wasm.wasm;
cd languages/elixir;
mix deps.get;
mix test;

// To use it in NodeJS...
cp wasm/target/wasm32-unknown-unknown/release/wasm.wasm languages/nodejs/src/vendor/wasm.wasm;
cd languages/nodejs;
npm install;
npm test;

// To use it in a React App...
cp wasm/target/wasm32-unknown-unknown/release/wasm.wasm languages/react-app/public/vendor/wasm.wasm;
cd languages/react-app;
npm install;
npm test -- --watchAll=false;
npm run build;
```

Checkout the [Github Action](./.github/workflows/test.yml) for more build information!
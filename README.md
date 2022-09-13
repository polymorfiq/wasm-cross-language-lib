This is just a repository for me to test out building a multi-language library via WebAssembly!

```
// First, build the WASM library
cd wasm;
cargo build --release;
cd ..;

// To use it in Elixir...
cp wasm/target/wasm32-unknown-unknown/release/wasm.wasm elixir/core/priv/wasm.wasm;
cd elixir/core;
mix deps.get;
mix test;

// To use it in NodeJS...
cp wasm/target/wasm32-unknown-unknown/release/wasm.wasm nodejs/core/vendor/wasm.wasm;
cd nodejs/core;
npm install;
npm test;
```

Checkout the [Github Action](./.github/workflows/test.yml) for more build information!
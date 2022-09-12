This is just a repository for me to test out building a multi-language library via WebAssembly!

```
// First, build the WASM library
cd lib_core;
cargo build --release;
cd ..;

// To use it in Elixir...
cp lib_core/target/wasm32-unknown-unknown/release/lib_core.wasm elixir/core/priv/lib_core.wasm;
cd elixir/core;
mix deps.get;
mix test;

// To use it in NodeJS...
cp lib_core/target/wasm32-unknown-unknown/release/lib_core.wasm nodejs/core/vendor/lib_core.wasm;
cd nodejs/core;
npm install;
npm test;
```

Checkout the [Github Action](./.github/workflows/test.yml) for more build information!
This is just a repository for me to test out building a multi-language library via WebAssembly!

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
cp wasm/target/wasm32-unknown-unknown/release/wasm.wasm languages/nodejs/vendor/wasm.wasm;
cd languages/nodejs;
npm install;
npm test;
```

Checkout the [Github Action](./.github/workflows/test.yml) for more build information!
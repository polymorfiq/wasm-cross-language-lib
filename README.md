This is just a repository for me to test out building a multi-language library via WebAssembly!

```
cd lib_core;
cargo test;
cargo build --target wasm32-unknown-unknown --release;
cp target/wasm32-unknown-unknown/release/lib_core.wasm ../elixir/core/priv/lib_core.wasm;
cd ..;

cd elixir/core;
mix deps.get;
mix test;
```

Checkout the [Github Action](.github/workflows/test.yml) for more build information!
```
cd lib_core;
cargo test;
cargo build --target wasm32-unknown-unknown --release;
cp target/wasm32-unknown-unknown/release/lib_core.wasm ../elixir/core/priv/lib_core.wasm
cd ..;

cd elixir/core;
mix deps.get;
mix test;
```
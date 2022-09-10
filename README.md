```
cd core;
cargo build --release;
cp target/wasm32-unknown-unknown/release/core.wasm ../elixir/core/priv/core.wasm
cd ..;

cd elixir/core;
mix deps.get;
mix run;
```
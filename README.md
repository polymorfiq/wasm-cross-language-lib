```
cd core;
cargo build --release;
cp target/wasm32-unknown-unknown/release/core.wasm ~/projects/cross-language/elixir/core/priv/core.wasm
cd ..;

cd elixir/core;
mix run;
```
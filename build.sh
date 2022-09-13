#!/usr/bin/env bash
set -euxo pipefail;

# Generate WASM file
pushd wasm && cargo build --release && popd;

# Copy to relevant language library ports
WASM_FILE="wasm/target/wasm32-unknown-unknown/release/wasm.wasm";
WASM_SIZE=$(stat -f%z $WASM_FILE);
WASM_SIZE_PRETTY=$(numfmt --to=iec-i --suffix=B --format="%9.2f" $WASM_SIZE)

cp $WASM_FILE languages/elixir/priv/wasm.wasm;
cp $WASM_FILE languages/nodejs/vendor/wasm.wasm;

# If wat-wasm is on the system, let's generate a text-based WASM for review
if command -v wat-wasm &> /dev/null
then
    wat-wasm $WASM_FILE -o latest.wat;
fi

printf "\nThe WASM filesize is $WASM_SIZE_PRETTY\n\n";
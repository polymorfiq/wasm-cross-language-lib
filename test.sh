#!/usr/bin/env bash
set -euxo pipefail;

pushd lib;
cargo test
popd;

pushd languages/elixir;
mix deps.get;
mix test;
popd;

pushd languages/nodejs;
npm install;
npm test;
popd;
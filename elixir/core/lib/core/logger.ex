defmodule Core.Logger do
  def log(log_str) do
    log_str |> IO.inspect(label: "WASM Log")
  end
end

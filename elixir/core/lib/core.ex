defmodule Core do
  use Application

  def start(_type, _args) do
    imports = %{
      env: %{
        respond: {:fn, [:i32, :i32], [], fn (_context, addr, data) ->
          {addr, data} |> IO.inspect(label: "respond")
          nil
        end},
      }
    }

    wasm_file = Application.app_dir(:core, "priv/core.wasm")
    {:ok, bytes} = File.read(wasm_file)
    {:ok, module} = Wasmex.Module.compile(bytes)
    {:ok, instance} = Wasmex.start_link(%{module: module, imports: imports})

    Wasmex.call_function(instance, "compute", [50, -8])
    {:ok, Task.async(fn -> IO.inspect("Done!") end).pid}
  end
end

defmodule Core do
  defstruct [:instance]

  def new do
    imports = %{
      env: %{
        respond: {:fn, [:i32, :i32], [], fn (_context, addr, data) ->
          {addr, data} |> IO.inspect(label: "respond")
          nil
        end},
      }
    }

    wasm_file = Application.app_dir(:core, "priv/lib_core.wasm")
    {:ok, bytes} = File.read(wasm_file)
    {:ok, module} = Wasmex.Module.compile(bytes)
    {:ok, instance} = Wasmex.start_link(%{module: module, imports: imports})

    %Core{instance: instance}
  end

  def multiply_by_two(core, num) do
    {:ok, [resp]} = Wasmex.call_function(core.instance, "multiply_by_two", [num])
    resp
  end
end

defmodule Core do
  defstruct [:instance]

  def new do
    wasm_file = Application.app_dir(:core, "priv/wasm.wasm")
    {:ok, bytes} = File.read(wasm_file)
    {:ok, module} = Wasmex.Module.compile(bytes)

    imports = %{
      env: %{
        report_log: {:fn, [:i32, :i32], [], fn (ctx, addr, length) ->
          log_str = Wasmex.Memory.read_binary(ctx.memory, addr, length)
          Core.Logger.log(log_str)
          nil
        end},
      }
    }

    {:ok, instance} = Wasmex.start_link(%{module: module, imports: imports})
    %Core{instance: instance}
  end

  def test_log(core, message) do
    {:ok, [str_addr]} = Wasmex.call_function(core.instance, "alloc_utf8_log", [byte_size(message)])
    {:ok, memory} = Wasmex.memory(core.instance, :uint8, 0)

    # Write to log buffer...
    :ok = Wasmex.Memory.write_binary(memory, str_addr, message)

    {:ok, _} = Wasmex.call_function(core.instance, "flush_utf8_logs", [])

    nil
  end

  def multiply_by_two(core, num) do
    {:ok, [resp]} = Wasmex.call_function(core.instance, "multiply_by_two", [num])
    resp
  end
end

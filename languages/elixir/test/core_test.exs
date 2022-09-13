defmodule CoreTest do
  use ExUnit.Case
  doctest Core

  import Mock

  setup do
    %{core: Core.new()}
  end

  test "multiply_by_two", %{core: c} do
    assert Core.multiply_by_two(c, 25) == 50
    assert Core.multiply_by_two(c, 50) == 100
    assert Core.multiply_by_two(c, 125) == 250
  end

  test "test", %{core: c} do
    with_mock Core.Logger, [log: fn(_msg) -> nil end] do
      Core.test_log(c, "aaa")
      Core.test_log(c, "bbb")
      Core.test_log(c, "This is a log")

      assert_called Core.Logger.log("aaa")
      assert_called Core.Logger.log("bbb")
      assert_called Core.Logger.log("This is a log")
    end
  end
end

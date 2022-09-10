defmodule CoreTest do
  use ExUnit.Case
  doctest Core

  setup do
    %{core: Core.new()}
  end

  test "greets the world", %{core: c} do
    assert Core.multiply_by_two(c, 25) == 50
    assert Core.multiply_by_two(c, 50) == 100
    assert Core.multiply_by_two(c, 125) == 250
  end
end

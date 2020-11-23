defmodule EscriptTest do
  use ExUnit.Case
  doctest Escript

  test "greets the world" do
    assert Escript.hello() == :world
  end
end

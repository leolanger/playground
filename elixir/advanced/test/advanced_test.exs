defmodule AdvancedTest do
  use ExUnit.Case
  doctest Advanced

  test "greets the world" do
    assert Advanced.hello() == :world
  end
end

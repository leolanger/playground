defmodule SpecificationsTest do
  use ExUnit.Case
  doctest Specifications

  test "greets the world" do
    assert Specifications.hello() == :world
  end
end

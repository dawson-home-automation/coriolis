defmodule StationTest do
  use ExUnit.Case
  doctest Station

  test "greets the world" do
    assert Station.hello() == :world
  end
end

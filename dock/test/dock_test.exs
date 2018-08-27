defmodule DockTest do
  use ExUnit.Case
  doctest Dock

  test "greets the world" do
    assert Dock.hello() == :world
  end
end

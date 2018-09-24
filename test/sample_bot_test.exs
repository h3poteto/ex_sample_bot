defmodule SampleBotTest do
  use ExUnit.Case
  doctest SampleBot

  test "greets the world" do
    assert SampleBot.hello() == :world
  end
end

defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "validate day 3 AOC from input" do
    result =
      "/Users/technosoul/Documents/development/training/elixir/aoc2015/test/input_day3.txt"
      |> File.read!()
      |> Day3.deliver()

    assert result == 2592
  end
end

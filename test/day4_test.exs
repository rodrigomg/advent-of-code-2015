defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  test "validate decode Enum of day 4 AOC from some input" do
    result =
      "ckczppom"
      |> Day4.decode_enum()

    assert result == {"00000FE1C139A2C710E9A5C03EC1AF03", "117946"}
  end

  test "validate decode Stream of day 4 AOC from some input" do
    result =
      "ckczppom"
      |> Day4.decode_stream()

    assert result == {"00000FE1C139A2C710E9A5C03EC1AF03", "117946"}
  end

  test "validate decode Flow of day 4 AOC from some input" do
    result =
      "ckczppom"
      |> Day4.decode_flow()

    assert result == {"00000FE1C139A2C710E9A5C03EC1AF03", "117946"}
  end
end

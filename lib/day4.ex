defmodule Day4 do
  @moduledoc """
  Documentation for `Day3`.
  """

  def decode_enum(input) do
    1..1_000_000
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(&String.pad_leading(&1, 6, "0"))
    |> Enum.map(&{input <> &1, &1})
    |> Enum.map(fn {input, i} -> {:crypto.hash(:md5, input), i} end)
    |> Enum.map(fn {h, i} -> {Base.encode16(h), i} end)
    |> Enum.find(fn {h, _} -> String.starts_with?(h, "00000") end)
  end

  def decode_stream(input) do
    1..1_000_000
    |> Stream.map(&Integer.to_string/1)
    |> Stream.map(&String.pad_leading(&1, 6, "0"))
    |> Stream.map(&{input <> &1, &1})
    |> Stream.map(fn {input, i} -> {:crypto.hash(:md5, input), i} end)
    |> Stream.map(fn {h, i} -> {Base.encode16(h), i} end)
    |> Enum.find(fn {h, _} -> String.starts_with?(h, "00000") end)
  end

  def decode_flow(input) do
    1..10_000_000
    |> Flow.from_enumerable()
    |> Flow.map(&Integer.to_string/1)
    |> Flow.map(&String.pad_leading(&1, 6, "0"))
    |> Flow.map(&{input <> &1, &1})
    |> Flow.map(fn {input, i} -> {:crypto.hash(:md5, input), i} end)
    |> Flow.map(fn {h, i} -> {Base.encode16(h), i} end)
    |> Enum.find(fn {h, _} -> String.starts_with?(h, "00000") end)
  end
end

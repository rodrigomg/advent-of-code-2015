defmodule Greet do
  def hello(), do: "Hello anon!"
  def hello(%{name: name}), do: "Hello #{name}!"
  def hello(name, lastname), do: "Hello #{name} Family #{lastname}!"
end

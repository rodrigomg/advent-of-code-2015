defmodule Greet2 do
  def hello(), do: "Hello anon!"
  def hello(%{name: name}), do: "Hello #{name}!"
  def hello(name, lastname), do: "Hello #{name} Family #{lastname}!"
  # def hello(acc \\ 0) do
  #  receive do
  #    {:hi, name, pid} ->
  #      send(pid, "Hello #{name} from #{inspect(self())}")
  #      hello(acc + 1)

  #    {:stop, pid} ->
  #      send(pid, "Bye from #{inspect(self())} ending with #{acc} calls")

  #    {:status, pid} ->
  #      send(pid, "Stats: #{acc} from #{inspect(self())}")
  #      hello(acc)

  #    {msg, pid} ->
  #      send(pid, "Msg from #{inspect(self())}: #{inspect(msg)}")
  #      hello(acc + 1)

  #    _ ->
  #      hello(acc)
  #  end
end

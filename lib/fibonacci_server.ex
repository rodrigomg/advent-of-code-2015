defmodule FibonacciServer do
  alias Fibonacci

  def handle_call({:compute, n}, parent, state) do
    case Map.get(state, n) do
      nil ->
        result = Fibonacci.sequence(n)
        send(parent, {:reply, result, Map.put(state, n, result)})

      result ->
        send(parent, {:reply, result, state})
    end
  end

  def handle_cast({:compute, n}, _parent, state) do
    case Map.get(state, n) do
      nil ->
        r = Fibonacci.sequence(n)
        {:no_reply, Map.put(state, n, r)}

      _r ->
        {:no_reply, state}
    end
  end

  def handle_message(_msg, _parent, state) do
    IO.inspect(state, label: "STATE")
    {:no_reply, state}
  end
end

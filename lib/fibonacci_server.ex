defmodule FibonacciServer do
  alias Fibonacci

  def handle_message(_msg, parent) do
    send(parent, {:ok, Fibonacci.sequence(1)})
  end
end

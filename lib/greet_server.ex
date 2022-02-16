defmodule GreetServer do
  alias Greet

  def handle_message(_msg, parent) do
    send(parent, {:ok, Greet.hello()})
  end
end

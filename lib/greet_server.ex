defmodule GreetServer do
  alias Greet

  def handle_message(_msg, parent, state) do
    send(parent, {:ok, Greet.hello(), state})
  end
end

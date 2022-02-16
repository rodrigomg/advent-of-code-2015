defmodule GenericServer do
  def start(module, parent \\ self(), init \\ []) do
    spawn(__MODULE__, :loop, [module, parent, init])
  end

  def loop(callback_module, parent, init) do
    receive do
      :kill ->
        :killed

      msg ->
        callback_module.handle_message(msg, parent)
        loop(callback_module, parent, init)
    end
  end
end

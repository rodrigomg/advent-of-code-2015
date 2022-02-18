defmodule GenericServer do
  def start(module, parent \\ self(), init \\ []) do
    spawn(__MODULE__, :loop, [module, parent, init])
  end

  # def call(pid, msg) do
  # end
  def cast(pid, msg) do
    send(pid, {:cast, msg})
  end

  def loop(callback_module, parent, init) do
    receive do
      :kill ->
        :killed

      {:cast, msg} ->
        {:no_reply, new_state} = callback_module.handle_cast(msg, parent, init)

        send(parent, new_state)

        loop(callback_module, parent, new_state)

      {:call, msg} ->
        {:reply, _result, new_state} = callback_module.handle_call(msg, parent, init)

        loop(callback_module, parent, new_state)
    end
  end
end

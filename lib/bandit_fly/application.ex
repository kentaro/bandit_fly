defmodule BanditFly.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BanditFly.Worker.start_link(arg)
      # {BanditFly.Worker, arg}
      {Bandit, plug: BanditFly.Plug, scheme: :http, options: [port: String.to_integer(System.get_env("PORT"))]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BanditFly.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

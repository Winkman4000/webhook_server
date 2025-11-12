defmodule WebhookServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: WebhookServer.Worker.start_link(arg)
      # {WebhookServer.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: WebhookServer, options: [port: 80]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebhookServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

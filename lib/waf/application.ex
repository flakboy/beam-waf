defmodule WAF.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Metrics.Agent, []},
      {Task, fn -> Http.Server.start(8080) end}
    ]

    opts = [strategy: :one_for_one, name: BeamWaf.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

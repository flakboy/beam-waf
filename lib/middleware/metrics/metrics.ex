defmodule Middleware.Metrics.Metrics do
  @behaviour :cowboy_middleware

  @impl true
  def execute(req, env) do
    increase_total()

    {:ok, req, env}
  end

  defp increase_total() do
    Metrics.Agent.add("total_requests", 1)
  end
end

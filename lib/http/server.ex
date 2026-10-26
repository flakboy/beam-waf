defmodule Http.Server do
  def start(port) do
    routes = Http.Router.routes()
    dispatch_rules = :cowboy_router.compile(routes)

    listener_name = :listener
    transport_opts = [{:port, port}]

    middlewares = [
      Middleware.Metrics.Metrics,

      # note: the below entries must always be included
      # unless you provide your own code handling the requests
      :cowboy_router,
      :cowboy_handler
    ]

    protocol_opts = %{
      env: %{dispatch: dispatch_rules},
      middlewares: middlewares
    }

    {:ok, _pid} =
      :cowboy.start_clear(
        listener_name,
        transport_opts,
        protocol_opts
      )
  end
end

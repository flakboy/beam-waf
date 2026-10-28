defmodule Metrics.Handler do
  def init(req0, state) do
    metrics =
      Metrics.Agent.get()
      |> Enum.map_join(
        "\n",
        fn {key, value} ->
          "#{key} #{value}"
        end
      )

    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/plain"},
        metrics,
        req0
      )

    {:ok, req1, state}
  end
end

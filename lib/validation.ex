defmodule Waf.Validation do
  require Logger

  def init(req0, state) do
    Logger.info("#{inspect(req0)}")

    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "Hello World",
        req0
      )

    {:ok, req1, state}
  end
end

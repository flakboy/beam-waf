defmodule Validation.Handler do
  def init(req0, state) do
    req1 =
      :cowboy_req.reply(
        200,
        %{"content-type" => "text/html"},
        "Hello world",
        req0
      )

    {:ok, req1, state}
  end
end

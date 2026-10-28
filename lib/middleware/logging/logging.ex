defmodule Middleware.Logging.Logging do
  require Logger

  @behaviour :cowboy_middleware

  @impl true
  def execute(req, env) do
    %{method: method, path: path, headers: headers, peer: peer} = req
    %{"user-agent" => user_agent} = headers
    # IO.puts("#{method} #{path} #{} #{user_agent} #{address_to_string(peer)}")
    Logger.info("#{method} #{path} #{} #{user_agent} #{address_to_string(peer)}")

    {:ok, req, env}
  end

  defp address_to_string({ip_tuple, port}) do
    ip_str =
      ip_tuple
      |> Tuple.to_list()
      |> Enum.map(fn num -> Integer.to_string(num) end)
      |> Enum.join(".")

    "#{ip_str}:#{port}"
  end
end

defmodule Http.Router do
  def routes do
    [
      {:_, [{"/", Waf.Validation, []}]}
    ]
  end
end

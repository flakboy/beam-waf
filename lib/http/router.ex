defmodule Http.Router do
  def routes do
    [
      {:_,
       [
         {"/metrics", Metrics.Handler, []},
         {"/", Validation.Handler, []}
       ]}
    ]
  end
end

defmodule Metrics.Agent do
  use Agent

  def start_link(_opts) do
    Agent.start_link(
      fn -> %{} end,
      name: __MODULE__
    )
  end

  def get do
    Agent.get(__MODULE__, fn metrics -> metrics end)
  end

  def get_metric_value(key) do
    Agent.get(__MODULE__, fn metrics -> metrics[key] end)
  end

  # TODO:
  # should keys be stored as strings or atoms?
  def add(key, added_value) do
    Agent.update(__MODULE__, fn metrics ->
      Map.update(
        metrics,
        key,
        added_value,
        fn current_value -> current_value + added_value end
      )
    end)
  end

  def set(key, new_value) do
    Agent.update(__MODULE__, fn metrics ->
      Map.put(metrics, key, new_value)
    end)
  end
end

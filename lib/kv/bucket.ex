defmodule KV.Bucket do
  use Agent

  @doc """
  Start a new bucket.
  """
  def start_link(_opts) do
    Agent.start_link(fn() -> %{} end)
  end

  @doc """
  Get value from bucket
  """
  def get(bucket, key) do
    Agent.get(bucket, fn(state) -> Map.get(state, key) end)
  end

  @doc """
  Puts the `value` for given `key` in the `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn(state) -> Map.put(state, key, value) end)
  end

  @doc """
  Deletes `key` from `bucket`

  Return the current value of `key`, if `key` exists
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn(state) -> Map.pop(state, key) end)
  end
end

defmodule B do
  use GenStage

  def start_link(number) do
    GenStage.start_link(B, number)
  end

  def init(number) do
    {:producer_consumer, number}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, fn(event) -> event * number end)
    {:noreply, events, number}
  end
end

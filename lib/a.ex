defmodule A do
  use GenStage

  def start_link(number) do
    GenStage.start_link(A, number)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # If counter is 3 and we ask for 2 items, we will
    # emit the items 3 and 4, and set state to 5.
    events = Enum.to_list(counter..counter+demand-1)
    {:noreply, events, counter + demand}
  end
end

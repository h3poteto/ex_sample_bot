defmodule Heavy.Jobs do
  def job do
    :timer.sleep(10000)
    {:ok}
  end

  def crash do
    :timer.sleep(5000)
    raise "Bad"
  end
end

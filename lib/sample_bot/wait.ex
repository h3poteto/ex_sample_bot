defmodule SampleBot.Wait do
  use Slack

  def job(channel, slack) do
    {:ok, pid} = Task.Supervisor.start_link()
    task = Task.Supervisor.async_nolink(pid, Heavy.Jobs, :job, [])
    Task.await(task, 20000)
    send_message("Hello world", channel, slack)
  end

  def crash(channel, slack) do
    {:ok, pid} = Task.Supervisor.start_link()
    try do
      task = Task.Supervisor.async_nolink(pid, Heavy.Jobs, :crash, [])
      Task.await(task, 20000)
      send_message("success", channel, slack)
    rescue
      e -> send_message("rescue", channel, slack)
    catch
      :exit, _ -> send_message("catch", channel, slack)
    end
  end

end

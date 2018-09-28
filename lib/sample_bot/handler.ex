defmodule SampleBot.Handler do
  use Slack

  def handle_message([user_id, "ping"] = _text, channel, slack, user_id) do
    send_message("pong", channel, slack)
  end

  def handle_message([user_id, "crash"] = _text, channel, slack, user_id) do
    Task.start(SampleBot.Wait, :crash, [channel, slack])
    send_message("Recieved.", channel, slack)
  end

  def handle_message([user_id | _mes] = _text, channel, slack, user_id) do
    Task.start(SampleBot.Wait, :job, [channel, slack])
    send_message("Recieved.", channel, slack)
  end

  def handle_message(_, _, _, _) do
    :ok
  end
end

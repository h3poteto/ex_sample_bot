defmodule SampleBot.Handler do
  use Slack

  def handle_message([user_id, "ping"] = _text, channel, slack, user_id) do
    send_message("pong", channel, slack)
  end

  def handle_message([user_id | mes] = _text, channel, slack, user_id) do
    send_message("Hello world", channel, slack)
  end

  def handle_message(_, _, _, _) do
    :ok
  end
end

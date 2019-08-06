defmodule Messenger.Twilio do
  @moduledoc """
    Service for delivering sms and mms messages
  """

  alias ExTwilio.{ Message }

  def create_whatsapp_sms(_parent, %{to: to, from: from, body: body}, _context) do
    whatsapp_sms(to, from, body)
  end

  def whatsapp_sms(target_number, my_twilio_number, body) do
    Message.create(to: target_number, from: my_twilio_number, body: body ) |> IO.inspect(label: "twillio whatsapp")
  end


end

class PrivatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "privates_channel_#{params[:private_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class PrivatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:privates_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

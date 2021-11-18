class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:room_id]}" end

  def unsubscribed 
    end
    # Any cleanup needed when channel is unsubscribed   
end

class SendEventMessageJob < ApplicationJob
  queue_as :default

  def perform(event_message)
    mine = ApplicationController.render(
      partial: 'event_messages/mine',
      locals: { event_message: event_message }
    )

    theirs = ApplicationController.render(
      partial: 'event_messages/theirs',
      locals: { event_message: event_message }
    )

    ActionCable.server.broadcast "event_channel_#{event_message.event_id}", mine: mine, theirs: theirs, event_message: event_message
  end
end

class SendPrivateMessageJob < ApplicationJob
  queue_as :default

  def perform(private_message)
    mine = ApplicationController.render(
      partial: 'private_messages/mine',
      locals: { private_message: private_message }
    )

    theirs = ApplicationController.render(
      partial: 'private_messages/theirs',
      locals: { private_message: private_message }
    )

    ActionCable.server.broadcast "privates_channel_#{private_message.private_id}", mine: mine, theirs: theirs, private_message: private_message
    # Do something later
  end
end

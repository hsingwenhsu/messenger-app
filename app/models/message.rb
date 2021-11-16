class Message < ApplicationRecord
  # belongs_to :user
  belongs_to :admin # tie a message to an admin
  belongs_to :room
end

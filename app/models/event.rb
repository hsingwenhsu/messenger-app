class Event < ApplicationRecord
    has_many :event_messages, dependent: :delete_all
    has_many :admins
    belongs_to :room
    has_many :admins, through: :event_messages
end

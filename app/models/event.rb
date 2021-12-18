class Event < ApplicationRecord
    has_many :event_messages, dependent: :delete_all
    has_many :admins
    has_many :attendances
    belongs_to :room
    has_many :admins, through: :event_messages
    has_many :admins, through: :attendances, dependent: :delete_all
end

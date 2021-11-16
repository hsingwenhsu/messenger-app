class Room < ApplicationRecord
  has_many :messages
  # has_many :admins
  # has_many :users, through: :messages
  has_many :admins, through: :messages # test for google user
  # has_many :users, through: :messages
end

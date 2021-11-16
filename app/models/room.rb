class Room < ApplicationRecord
  has_many :messages
  
  has_many :admins, through: :messages # test for google user
  has_many :admins, through: :enrollments
end

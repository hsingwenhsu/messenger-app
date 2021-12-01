class Private < ApplicationRecord
    has_many :private_messages
    has_many :admins
    has_many :admins, through: :private_messages # test for google user
end

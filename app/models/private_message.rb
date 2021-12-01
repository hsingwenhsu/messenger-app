class PrivateMessage < ApplicationRecord
    belongs_to :admin
    belongs_to :private
end

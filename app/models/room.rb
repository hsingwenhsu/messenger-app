class Room < ApplicationRecord
  has_many :messages
  has_many :admins
  has_many :posts, -> { order 'updated_at desc' }, dependent: :delete_all
  has_many :events
  has_many :admins, through: :messages # test for google user
  has_many :admins, through: :enrollments
  
  def self.search(search)
    if search.blank?
      @rooms = Room.all
    else
      @search_param = search.downcase
      @rooms = Room.all.where("lower(name) LIKE :search", search: "%#{@search_param}%")
    end
  end
end

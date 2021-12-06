class Room < ApplicationRecord
  has_many :messages, dependent: :delete_all
  has_many :admins
  has_many :posts, -> { order 'updated_at desc' }, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :admins, through: :messages, dependent: :delete_all # test for google user
  has_many :admins, through: :enrollments, dependent: :delete_all
  
  def self.search(search)
    if search.blank?
      @rooms = Room.all
    else
      @search_param = search.downcase
      @rooms = Room.all.where("lower(name) LIKE :search", search: "%#{@search_param}%")
    end
  end
end

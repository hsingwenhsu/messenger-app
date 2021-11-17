require 'rails_helper'

RSpec.describe "Rooms", type: :request do

  before(:all) do
    room = Room.create!
    Capybara.default_host = 'localhost:3000'
    default_url_options[:host] = 'localhost:3000'
    email_length = rand(20...50)
    email = (0...email_length).map { ('a'..'z').to_a[rand(26)] }.join+'@columbia.edu'
    admin = Admin.create!(:uid => "111101028321895", :email => email, :full_name => 'Test')
    login_as(admin, :scope => :admin)
    current_admin = admin
  end
  
  describe "GET /index" do
    it 'renders a successful response' do
      room = Room.create!
      get rooms_url
      expect(response).to be_successful
    end
  end
  describe "GET /show" do
    it "renders a successful response" do
      room = Room.create!
      get room_url(room)
      expect(response).to be_successful
    end
  end
  describe 'room' do
    context 'with valid parameters' do
      it 'create a new room' do
        room = Room.create!
        expect {
          room = Room.create!
        }.to change(Room, :count).by(1)
      end
    end
  end
end
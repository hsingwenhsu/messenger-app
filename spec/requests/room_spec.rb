require 'rails_helper'

RSpec.describe "Rooms", type: :request do

  let(:valid_attributes) {
    {:name => "test name"}
  }

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

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Room" do
        expect {
          post rooms_url, params: { room: valid_attributes }
        }.to change(Room, :count).by(1)
      end
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) {
      {:name => "test update name"}
    }
    it "update the requested room" do
      room = Room.create!(valid_attributes)
      patch room_url(room), params: { room: new_attributes }
      room.reload
      expect(response).to redirect_to(room_url(room))
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested room" do
      room = Room.create!(valid_attributes)
      expect {
        delete room_url(room)
      }.to change(Room, :count).by(-1)
    end

  end
end
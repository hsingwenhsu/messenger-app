require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /index" do
    it 'renders a successful response' do
      room = Room.new
      get rooms_url
      expect(response).to be_successful
    end
  end
  describe "GET /show" do
    it "renders a successful response" do
      room = Room.new
      get room_url(room)
      expect(response).to be_successful
    end
  end
  describe 'room' do
    context 'with valid parameters' do
      it 'create a new room' do
        room = Room.create()
        expect {
          room = Room.create()
        }.to change(Room, :count).by(1)
      end
    end
  end
end
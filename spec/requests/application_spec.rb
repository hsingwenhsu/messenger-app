require 'rails_helper'

RSpec.describe "Applications", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end
  describe 'current_user' do
    context 'current user is present' do
      it 'does not create a new user' do
        get '/rooms'
        expect {
          get '/rooms'
        }.to change(User, :count).by(0)
      end
    end
    
    context 'current user is not present' do
      it 'creates a new user' do
        expect {
          get '/rooms'
        }.to change(User, :count).by(1)
      end
    end
  end
end

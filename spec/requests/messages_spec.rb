require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "Messages", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end



  let(:valid_attributes) {
    {:content => 'hi', :admin_id => 1, :room_id => 1}
  }

  let(:invalid_attributes) {
    {:content => 'hi', :admin_id => 1000, :room_id => 1000}
  }

  before(:all) do
    # User.generate
    room = Room.create!
    # Admin.from_google({
    #   uid: '1111',
    #   email: 'test@columbia.edu',
    #   full_name: 'test_name',
    #   avatar_url: 'test_url'
    # })
    # OmniAuth.config.test_mode = true
    # OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    #   :uid => '1111',
    #   :email => 'test@columbia.edu',
    #   :full_name => 'test_name',
    #   :avatar_url => 'test_url'
    #   # etc.
    # })
    admin = Admin.create!(:uid => "111101028321895", :email => '2@columbia.edu', :full_name => 'Test')
    # user = Admin.find_by(uid: "111101028321895")
    login_as(admin, :scope => :admin)
    current_admin = admin
    # puts 12341234

  end

  describe "GET /index" do
    it "renders a successful response" do
      Message.create!(valid_attributes)
      get messages_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      message = Message.create!(valid_attributes)
      get message_url(message)
      expect(response).to be_successful
    end
  end

  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_message_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /edit" do
  #   it "renders a successful response" do
  #     message = Message.create!(:content => 'hi', :user_id => 1, :room_id => 1)
  #     get edit_message_url(message)
  #     expect(response).to be_successful
  #   end
  # end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new message" do
        expect {
          post messages_url, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end

      # it "redirects to the created message" do
      #   post messages_url, params: { message: valid_attributes }
      #   expect(response).to redirect_to(message_url(Message.last))
      # end
    end

    context "with invalid parameters" do
      it "does not create a new message" do
        expect {
          post messages_url, params: { message: invalid_attributes }
        }.to raise_error(ActiveJob::SerializationError)
      end
      
      # it "renders a successful response (i.e. to display the 'new' template)" do
      #   post messages_url, params: { message: invalid_attributes }
      #   expect(response).to be_successful
      # end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested message" do
      message = Message.create!(valid_attributes)
      expect {
        delete message_url(message)
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the messages list" do
      message = Message.create!(valid_attributes)
      delete message_url(message)
      expect(response).to redirect_to(messages_url)
    end
  end
end
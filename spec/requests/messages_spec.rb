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
  let(:new_attributes) {
    {:content => 'hiiiii', :admin_id => 1, :room_id => 1}
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
    Capybara.default_host = 'localhost:3000'
    # puts default_url_options
    default_url_options[:host] = 'localhost:3000'
    # puts default_url_options
    email_length = rand(20...50)
    email = (0...email_length).map { ('a'..'z').to_a[rand(26)] }.join+'@columbia.edu'
    admin = Admin.create!(:uid => "111101028321895", :email => email, :full_name => 'Test')
    # puts 'email'
    # puts email
    # puts email_length
    # user = Admin.find_by(uid: "111101028321895")
    login_as(admin, :scope => :admin)
    current_admin = admin
    

  end

  describe "GET /index" do
    it "renders a successful response" do
      
      # @request.host = localhost:3000
      # puts @request.host
      Message.create!(valid_attributes)
      # get "/messages" # , headers: { "HTTP_REFERER": "localhost:3000" }
      get messages_url
      # puts messages_url
      # puts response.header
      # puts response.body
      expect(response).to be_successful
      
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      message = Message.create!(valid_attributes)
      get message_url(message)
      # puts 1234
      # puts message_url(message) # .http://localhost/messages/1
      # get '/messages/1'
      # puts response.header
      # puts response.body
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
        # puts messages_url # .http://localhost/messages
        # puts message_url # http://localhost/messages/1
        
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
  
  describe "PATCH /update" do
    it "update the requested message" do
      message = Message.create!(valid_attributes)
      patch message_url(message), params: { message: new_attributes }
      message.reload
      expect(response).to redirect_to(message_url(message))
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested message" do
      message = Message.create!(valid_attributes)
      puts message
      expect {
        delete message_url(message)
      }.to change(Message, :count).by(-1)
    end
  end



end
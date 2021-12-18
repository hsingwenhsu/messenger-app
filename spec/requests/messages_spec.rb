require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "Messages", type: :request do
  
  let(:valid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    {
      :admin_id => @admin.id,
      :room_id => @room.id,
      :content => 'Hi'
    }
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    {
      :admin_id => @admin.id + 1,
      :room_id => @room.id + 1,
      :content => 'Hi'
    }
  }

  before(:each) do
    @admin = Admin.create!({
      :email => 'test@columbia.edu',
      :full_name => 'test',
      :uid => '',
      :avatar_url => ''
    })
    @room = Room.create!({
      :name => 'ESaaS'
    })
    login_as(@admin, :scope => :admin)
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

    # context "with invalid parameters" do
    #   it "does not create a new message" do
    #     expect {
    #       post messages_url, params: { message: invalid_attributes }
    #     }.to raise_error(ActiveRecord::InvalidForeignKey)
    #   end
      
    #   it "renders a successful response (i.e. to display the 'new' template)" do
    #     post messages_url, params: { message: invalid_attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE /destroy" do
    it "destroys the requested message" do
      message = Message.create!(valid_attributes)
      expect {
        delete message_url(message)
      }.to change(Message, :count).by(-1)
    end

    # it "redirects to the messages list" do
    #   message = Message.create!(valid_attributes)
    #   delete message_url(message)
    #   expect(response).to redirect_to(messages_url)
    # end
  end
end

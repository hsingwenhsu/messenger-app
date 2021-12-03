require "rails_helper"

RSpec.describe EventMessagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/event_messages").to route_to("event_messages#index")
    end

    it "routes to #new" do
      expect(get: "/event_messages/new").to route_to("event_messages#new")
    end

    it "routes to #show" do
      expect(get: "/event_messages/1").to route_to("event_messages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/event_messages/1/edit").to route_to("event_messages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/event_messages").to route_to("event_messages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/event_messages/1").to route_to("event_messages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/event_messages/1").to route_to("event_messages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/event_messages/1").to route_to("event_messages#destroy", id: "1")
    end
  end
end

require "rails_helper"

RSpec.describe PostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rooms/1/posts").to route_to("posts#index", room_id: "1")
    end

    it "routes to #new" do
      expect(get: "/rooms/1/posts/new").to route_to("posts#new", room_id: "1")
    end

    it "routes to #show" do
      expect(get: "/rooms/1/posts/1").to route_to("posts#show", id: "1", room_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rooms/1/posts/1/edit").to route_to("posts#edit", id: "1", room_id: "1")
    end


    it "routes to #create" do
      expect(post: "/rooms/1/posts").to route_to("posts#create", room_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/rooms/1/posts/1").to route_to("posts#update", id: "1", room_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rooms/1/posts/1").to route_to("posts#update", id: "1", room_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rooms/1/posts/1").to route_to("posts#destroy", id: "1", room_id: "1")
    end
  end
end

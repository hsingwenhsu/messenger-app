require "rails_helper"

RSpec.describe PrivatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/privates").to route_to("privates#index")
    end

    it "routes to #new" do
      expect(get: "/privates/new").to route_to("privates#new")
    end

    it "routes to #show" do
      expect(get: "/privates/1").to route_to("privates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/privates/1/edit").to route_to("privates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/privates").to route_to("privates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/privates/1").to route_to("privates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/privates/1").to route_to("privates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/privates/1").to route_to("privates#destroy", id: "1")
    end
  end
end

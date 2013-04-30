require "spec_helper"

describe ContactFeewisesController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_feewises").should route_to("contact_feewises#index")
    end

    it "routes to #new" do
      get("/contact_feewises/new").should route_to("contact_feewises#new")
    end

    it "routes to #show" do
      get("/contact_feewises/1").should route_to("contact_feewises#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_feewises/1/edit").should route_to("contact_feewises#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_feewises").should route_to("contact_feewises#create")
    end

    it "routes to #update" do
      put("/contact_feewises/1").should route_to("contact_feewises#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_feewises/1").should route_to("contact_feewises#destroy", :id => "1")
    end

  end
end

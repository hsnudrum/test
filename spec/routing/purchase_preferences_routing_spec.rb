require "spec_helper"

describe PurchasePreferencesController do
  describe "routing" do

    it "routes to #index" do
      get("/purchase_preferences").should route_to("purchase_preferences#index")
    end

    it "routes to #new" do
      get("/purchase_preferences/new").should route_to("purchase_preferences#new")
    end

    it "routes to #show" do
      get("/purchase_preferences/1").should route_to("purchase_preferences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/purchase_preferences/1/edit").should route_to("purchase_preferences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/purchase_preferences").should route_to("purchase_preferences#create")
    end

    it "routes to #update" do
      put("/purchase_preferences/1").should route_to("purchase_preferences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/purchase_preferences/1").should route_to("purchase_preferences#destroy", :id => "1")
    end

  end
end

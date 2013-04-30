require "spec_helper"

describe DiscountCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/discount_codes").should route_to("discount_codes#index")
    end

    it "routes to #new" do
      get("/discount_codes/new").should route_to("discount_codes#new")
    end

    it "routes to #show" do
      get("/discount_codes/1").should route_to("discount_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/discount_codes/1/edit").should route_to("discount_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/discount_codes").should route_to("discount_codes#create")
    end

    it "routes to #update" do
      put("/discount_codes/1").should route_to("discount_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/discount_codes/1").should route_to("discount_codes#destroy", :id => "1")
    end

  end
end

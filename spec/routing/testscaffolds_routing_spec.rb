require "spec_helper"

describe TestscaffoldsController do
  describe "routing" do

    it "routes to #index" do
      get("/testscaffolds").should route_to("testscaffolds#index")
    end

    it "routes to #new" do
      get("/testscaffolds/new").should route_to("testscaffolds#new")
    end

    it "routes to #show" do
      get("/testscaffolds/1").should route_to("testscaffolds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/testscaffolds/1/edit").should route_to("testscaffolds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/testscaffolds").should route_to("testscaffolds#create")
    end

    it "routes to #update" do
      put("/testscaffolds/1").should route_to("testscaffolds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/testscaffolds/1").should route_to("testscaffolds#destroy", :id => "1")
    end

  end
end

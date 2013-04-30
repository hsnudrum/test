require "spec_helper"

describe FilterAnalyticsController do
  describe "routing" do

    it "routes to #index" do
      get("/filter_analytics").should route_to("filter_analytics#index")
    end

    it "routes to #new" do
      get("/filter_analytics/new").should route_to("filter_analytics#new")
    end

    it "routes to #show" do
      get("/filter_analytics/1").should route_to("filter_analytics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/filter_analytics/1/edit").should route_to("filter_analytics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/filter_analytics").should route_to("filter_analytics#create")
    end

    it "routes to #update" do
      put("/filter_analytics/1").should route_to("filter_analytics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/filter_analytics/1").should route_to("filter_analytics#destroy", :id => "1")
    end

  end
end

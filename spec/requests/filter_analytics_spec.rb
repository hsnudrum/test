require 'spec_helper'

describe "FilterAnalytics" do
  describe "GET /filter_analytics" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get filter_analytics_path
      response.status.should be(200)
    end
  end
end

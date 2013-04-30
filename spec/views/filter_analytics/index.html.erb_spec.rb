require 'spec_helper'

describe "filter_analytics/index" do
  before(:each) do
    assign(:filter_analytics, [
      stub_model(FilterAnalytic,
        :password => "Password",
        :filter_name => "Filter Name"
      ),
      stub_model(FilterAnalytic,
        :password => "Password",
        :filter_name => "Filter Name"
      )
    ])
  end

  it "renders a list of filter_analytics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Filter Name".to_s, :count => 2
  end
end

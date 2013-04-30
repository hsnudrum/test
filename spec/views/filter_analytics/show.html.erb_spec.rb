require 'spec_helper'

describe "filter_analytics/show" do
  before(:each) do
    @filter_analytic = assign(:filter_analytic, stub_model(FilterAnalytic,
      :password => "Password",
      :filter_name => "Filter Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
    rendered.should match(/Filter Name/)
  end
end

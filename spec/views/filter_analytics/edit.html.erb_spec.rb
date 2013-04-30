require 'spec_helper'

describe "filter_analytics/edit" do
  before(:each) do
    @filter_analytic = assign(:filter_analytic, stub_model(FilterAnalytic,
      :password => "MyString",
      :filter_name => "MyString"
    ))
  end

  it "renders the edit filter_analytic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => filter_analytics_path(@filter_analytic), :method => "post" do
      assert_select "input#filter_analytic_password", :name => "filter_analytic[password]"
      assert_select "input#filter_analytic_filter_name", :name => "filter_analytic[filter_name]"
    end
  end
end

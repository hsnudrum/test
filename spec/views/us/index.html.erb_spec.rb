require 'spec_helper'

describe "us/index" do
  before(:each) do
    assign(:us, [
      stub_model(U,
        :name => "Name",
        :note => "MyText",
        :url => "Url",
        :slug => "Slug"
      ),
      stub_model(U,
        :name => "Name",
        :note => "MyText",
        :url => "Url",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of us" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end

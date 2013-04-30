require 'spec_helper'

describe "us/show" do
  before(:each) do
    @u = assign(:u, stub_model(U,
      :name => "Name",
      :note => "MyText",
      :url => "Url",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Slug/)
  end
end

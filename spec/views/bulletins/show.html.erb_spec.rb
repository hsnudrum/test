require 'spec_helper'

describe "bulletins/show" do
  before(:each) do
    @bulletin = assign(:bulletin, stub_model(Bulletin,
      :body => "Body",
      :kind => "Kind",
      :hide => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
    rendered.should match(/Kind/)
    rendered.should match(/false/)
  end
end

require 'spec_helper'

describe "bulletins/index" do
  before(:each) do
    assign(:bulletins, [
      stub_model(Bulletin,
        :body => "Body",
        :kind => "Kind",
        :hide => false
      ),
      stub_model(Bulletin,
        :body => "Body",
        :kind => "Kind",
        :hide => false
      )
    ])
  end

  it "renders a list of bulletins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

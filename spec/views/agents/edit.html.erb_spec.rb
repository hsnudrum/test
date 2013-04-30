require 'spec_helper'

describe "agents/edit" do
  before(:each) do
    @agent = assign(:agent, stub_model(Agent))
  end

  it "renders the edit agent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agents_path(@agent), :method => "post" do
    end
  end
end

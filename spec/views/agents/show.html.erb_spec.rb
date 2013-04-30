require 'spec_helper'

describe "agents/show" do
  before(:each) do
    @agent = assign(:agent, stub_model(Agent))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

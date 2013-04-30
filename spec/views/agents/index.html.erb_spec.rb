require 'spec_helper'

describe "agents/index" do
  before(:each) do
    assign(:agents, [
      stub_model(Agent),
      stub_model(Agent)
    ])
  end

  it "renders a list of agents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

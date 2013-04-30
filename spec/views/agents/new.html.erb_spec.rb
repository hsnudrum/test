require 'spec_helper'

describe "agents/new" do
  before(:each) do
    assign(:agent, stub_model(Agent).as_new_record)
  end

  it "renders new agent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agents_path, :method => "post" do
    end
  end
end

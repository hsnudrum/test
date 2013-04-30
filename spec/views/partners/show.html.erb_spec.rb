require 'spec_helper'

describe "partners/show" do
  before(:each) do
    @partner = assign(:partner, stub_model(Partner,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :user_id => 1,
      :list_name => "List Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/List Name/)
  end
end

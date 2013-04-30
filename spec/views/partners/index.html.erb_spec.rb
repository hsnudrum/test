require 'spec_helper'

describe "partners/index" do
  before(:each) do
    assign(:partners, [
      stub_model(Partner,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :user_id => 1,
        :list_name => "List Name"
      ),
      stub_model(Partner,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :user_id => 1,
        :list_name => "List Name"
      )
    ])
  end

  it "renders a list of partners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "List Name".to_s, :count => 2
  end
end

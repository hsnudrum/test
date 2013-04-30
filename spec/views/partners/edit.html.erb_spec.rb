require 'spec_helper'

describe "partners/edit" do
  before(:each) do
    @partner = assign(:partner, stub_model(Partner,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :user_id => 1,
      :list_name => "MyString"
    ))
  end

  it "renders the edit partner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => partners_path(@partner), :method => "post" do
      assert_select "input#partner_first_name", :name => "partner[first_name]"
      assert_select "input#partner_last_name", :name => "partner[last_name]"
      assert_select "input#partner_email", :name => "partner[email]"
      assert_select "input#partner_user_id", :name => "partner[user_id]"
      assert_select "input#partner_list_name", :name => "partner[list_name]"
    end
  end
end

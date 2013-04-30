require 'spec_helper'

describe "contact_feewises/index" do
  before(:each) do
    assign(:contact_feewises, [
      stub_model(ContactFeewise,
        :to => "To",
        :cc => "Cc",
        :subject => "Subject",
        :body => "MyText",
        :label => "Label",
        :user_id => 1
      ),
      stub_model(ContactFeewise,
        :to => "To",
        :cc => "Cc",
        :subject => "Subject",
        :body => "MyText",
        :label => "Label",
        :user_id => 1
      )
    ])
  end

  it "renders a list of contact_feewises" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To".to_s, :count => 2
    assert_select "tr>td", :text => "Cc".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

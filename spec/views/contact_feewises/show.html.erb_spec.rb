require 'spec_helper'

describe "contact_feewises/show" do
  before(:each) do
    @contact_feewise = assign(:contact_feewise, stub_model(ContactFeewise,
      :to => "To",
      :cc => "Cc",
      :subject => "Subject",
      :body => "MyText",
      :label => "Label",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To/)
    rendered.should match(/Cc/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
    rendered.should match(/Label/)
    rendered.should match(/1/)
  end
end

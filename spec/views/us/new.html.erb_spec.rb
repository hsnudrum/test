require 'spec_helper'

describe "us/new" do
  before(:each) do
    assign(:u, stub_model(U,
      :name => "MyString",
      :note => "MyText",
      :url => "MyString",
      :slug => "MyString"
    ).as_new_record)
  end

  it "renders new u form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => us_path, :method => "post" do
      assert_select "input#u_name", :name => "u[name]"
      assert_select "textarea#u_note", :name => "u[note]"
      assert_select "input#u_url", :name => "u[url]"
      assert_select "input#u_slug", :name => "u[slug]"
    end
  end
end

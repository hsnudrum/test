require 'spec_helper'

describe "bulletins/new" do
  before(:each) do
    assign(:bulletin, stub_model(Bulletin,
      :body => "MyString",
      :kind => "MyString",
      :hide => false
    ).as_new_record)
  end

  it "renders new bulletin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bulletins_path, :method => "post" do
      assert_select "input#bulletin_body", :name => "bulletin[body]"
      assert_select "input#bulletin_kind", :name => "bulletin[kind]"
      assert_select "input#bulletin_hide", :name => "bulletin[hide]"
    end
  end
end

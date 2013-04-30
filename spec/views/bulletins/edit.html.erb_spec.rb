require 'spec_helper'

describe "bulletins/edit" do
  before(:each) do
    @bulletin = assign(:bulletin, stub_model(Bulletin,
      :body => "MyString",
      :kind => "MyString",
      :hide => false
    ))
  end

  it "renders the edit bulletin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bulletins_path(@bulletin), :method => "post" do
      assert_select "input#bulletin_body", :name => "bulletin[body]"
      assert_select "input#bulletin_kind", :name => "bulletin[kind]"
      assert_select "input#bulletin_hide", :name => "bulletin[hide]"
    end
  end
end

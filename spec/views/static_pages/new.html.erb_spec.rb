require 'spec_helper'

describe "static_pages/new" do
  before(:each) do
    assign(:static_page, stub_model(StaticPage,
      :placeholder => false
    ).as_new_record)
  end

  it "renders new static_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => static_pages_path, :method => "post" do
      assert_select "input#static_page_placeholder", :name => "static_page[placeholder]"
    end
  end
end

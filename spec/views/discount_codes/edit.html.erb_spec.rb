require 'spec_helper'

describe "discount_codes/edit" do
  before(:each) do
    @discount_code = assign(:discount_code, stub_model(DiscountCode,
      :code => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit discount_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => discount_codes_path(@discount_code), :method => "post" do
      assert_select "input#discount_code_code", :name => "discount_code[code]"
      assert_select "input#discount_code_price", :name => "discount_code[price]"
    end
  end
end

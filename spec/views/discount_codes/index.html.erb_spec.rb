require 'spec_helper'

describe "discount_codes/index" do
  before(:each) do
    assign(:discount_codes, [
      stub_model(DiscountCode,
        :code => "Code",
        :price => "9.99"
      ),
      stub_model(DiscountCode,
        :code => "Code",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of discount_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

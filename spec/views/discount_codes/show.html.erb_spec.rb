require 'spec_helper'

describe "discount_codes/show" do
  before(:each) do
    @discount_code = assign(:discount_code, stub_model(DiscountCode,
      :code => "Code",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/9.99/)
  end
end

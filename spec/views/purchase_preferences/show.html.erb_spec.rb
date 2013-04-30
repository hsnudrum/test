require 'spec_helper'

describe "purchase_preferences/show" do
  before(:each) do
    @purchase_preference = assign(:purchase_preference, stub_model(PurchasePreference,
      :location => "Location",
      :min_price => "Min Price",
      :max_price => "Max Price",
      :time_frame => "Time Frame",
      :daytime_phone => "Daytime Phone",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    rendered.should match(/Min Price/)
    rendered.should match(/Max Price/)
    rendered.should match(/Time Frame/)
    rendered.should match(/Daytime Phone/)
    rendered.should match(//)
  end
end

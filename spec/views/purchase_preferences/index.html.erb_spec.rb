require 'spec_helper'

describe "purchase_preferences/index" do
  before(:each) do
    assign(:purchase_preferences, [
      stub_model(PurchasePreference,
        :location => "Location",
        :min_price => "Min Price",
        :max_price => "Max Price",
        :time_frame => "Time Frame",
        :daytime_phone => "Daytime Phone",
        :user => nil
      ),
      stub_model(PurchasePreference,
        :location => "Location",
        :min_price => "Min Price",
        :max_price => "Max Price",
        :time_frame => "Time Frame",
        :daytime_phone => "Daytime Phone",
        :user => nil
      )
    ])
  end

  it "renders a list of purchase_preferences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Min Price".to_s, :count => 2
    assert_select "tr>td", :text => "Max Price".to_s, :count => 2
    assert_select "tr>td", :text => "Time Frame".to_s, :count => 2
    assert_select "tr>td", :text => "Daytime Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'spec_helper'

describe "purchase_preferences/edit" do
  before(:each) do
    @purchase_preference = assign(:purchase_preference, stub_model(PurchasePreference,
      :location => "MyString",
      :min_price => "MyString",
      :max_price => "MyString",
      :time_frame => "MyString",
      :daytime_phone => "MyString",
      :user => nil
    ))
  end

  it "renders the edit purchase_preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchase_preferences_path(@purchase_preference), :method => "post" do
      assert_select "input#purchase_preference_location", :name => "purchase_preference[location]"
      assert_select "input#purchase_preference_min_price", :name => "purchase_preference[min_price]"
      assert_select "input#purchase_preference_max_price", :name => "purchase_preference[max_price]"
      assert_select "input#purchase_preference_time_frame", :name => "purchase_preference[time_frame]"
      assert_select "input#purchase_preference_daytime_phone", :name => "purchase_preference[daytime_phone]"
      assert_select "input#purchase_preference_user", :name => "purchase_preference[user]"
    end
  end
end

require 'spec_helper'

describe "cards/new" do
  before(:each) do
    assign(:card, stub_model(Card,
      :email => "MyString",
      :day_phone => "MyString",
      :user => nil,
      :stripe_card_token => "MyString",
      :paid => false
    ).as_new_record)
  end

  it "renders new card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cards_path, :method => "post" do
      assert_select "input#card_email", :name => "card[email]"
      assert_select "input#card_day_phone", :name => "card[day_phone]"
      assert_select "input#card_user", :name => "card[user]"
      assert_select "input#card_stripe_card_token", :name => "card[stripe_card_token]"
      assert_select "input#card_paid", :name => "card[paid]"
    end
  end
end

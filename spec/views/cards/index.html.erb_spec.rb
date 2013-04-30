require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card,
        :email => "Email",
        :day_phone => "Day Phone",
        :user => nil,
        :stripe_card_token => "Stripe Card Token",
        :paid => false
      ),
      stub_model(Card,
        :email => "Email",
        :day_phone => "Day Phone",
        :user => nil,
        :stripe_card_token => "Stripe Card Token",
        :paid => false
      )
    ])
  end

  it "renders a list of cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Day Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Card Token".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

require 'spec_helper'

describe "cards/show" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :email => "Email",
      :day_phone => "Day Phone",
      :user => nil,
      :stripe_card_token => "Stripe Card Token",
      :paid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Day Phone/)
    rendered.should match(//)
    rendered.should match(/Stripe Card Token/)
    rendered.should match(/false/)
  end
end

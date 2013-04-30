ActiveAdmin.register Card, as: "Tracking" do
  config.clear_action_items!
  menu label: "Tracking"
  filter :updated_at
  index title: "Tracking" do
    column :id
    column :email do |card|
      mail_to card.email
    end
    column :day_phone
    column :stripe_card_token
    column :paid
    column :updated_at
    column :cardholder_name
    column :billing_address
    column :city
    column :state
    column :postal_code
    column :discount_code
    column :amount_paid do |card|
      number_to_currency(card.amount_paid.to_i / 100)
    end
  end
end

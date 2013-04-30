class AddToFieldsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :cardholder_name, :string
    add_column :cards, :billing_address, :string
    add_column :cards, :city, :string
    add_column :cards, :state, :string
    add_column :cards, :postal_code, :string
  end
end

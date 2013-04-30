class AddFirstAndLastNameToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :first_name, :string
    add_column :subscriptions, :last_name, :string
  end
end

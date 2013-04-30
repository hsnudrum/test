class AddIgnorePartnersToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :ignore_partners, :boolean
  end
end

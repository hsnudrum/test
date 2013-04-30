class AddFieldsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :user_id, :integer
    add_column :accounts, :when_paid, :string
    add_column :accounts, :amount_paid, :integer
    add_column :accounts, :feewise_token, :string
  end
end

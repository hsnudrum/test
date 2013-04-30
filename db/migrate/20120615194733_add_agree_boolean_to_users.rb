class AddAgreeBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :agree, :boolean
  end
end

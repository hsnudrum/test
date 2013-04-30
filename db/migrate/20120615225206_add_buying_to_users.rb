class AddBuyingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :buying, :boolean
  end
end

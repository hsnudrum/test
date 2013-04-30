class RemoveEmailFromCard < ActiveRecord::Migration
  def up
    remove_column :cards, :email
  end

  def down
    add_column :cards, :email, :string
  end
end

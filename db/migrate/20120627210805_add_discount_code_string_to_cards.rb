class AddDiscountCodeStringToCards < ActiveRecord::Migration
  def change
    add_column :cards, :discount_code, :string
  end
end

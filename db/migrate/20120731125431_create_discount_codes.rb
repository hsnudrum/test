class CreateDiscountCodes < ActiveRecord::Migration
  def change
    create_table :discount_codes do |t|
      t.string :code
      t.decimal :price
      t.date :expiration

      t.timestamps
    end
  end
end

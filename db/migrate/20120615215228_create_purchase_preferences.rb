class CreatePurchasePreferences < ActiveRecord::Migration
  def change
    create_table :purchase_preferences do |t|
      t.string :location
      t.string :min_price
      t.string :max_price
      t.string :time_frame
      t.string :daytime_phone
      t.references :user

      t.timestamps
    end
    add_index :purchase_preferences, :user_id
  end
end

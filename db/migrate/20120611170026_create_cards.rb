class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :email
      t.string :day_phone
      t.references :user
      t.string :stripe_card_token
      t.boolean :paid

      t.timestamps
    end
    add_index :cards, :user_id
  end
end

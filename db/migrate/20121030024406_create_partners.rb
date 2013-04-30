class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :user_id
      t.string :list_name

      t.timestamps
    end
  end
end

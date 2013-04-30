class CreateContactFeewises < ActiveRecord::Migration
  def change
    create_table :contact_feewises do |t|
      t.string :to
      t.string :cc
      t.string :subject
      t.text :body
      t.string :label
      t.integer :user_id

      t.timestamps
    end
  end
end

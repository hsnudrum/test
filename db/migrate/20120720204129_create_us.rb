class CreateUs < ActiveRecord::Migration
  def change
    create_table :us do |t|
      t.string :name
      t.text :note
      t.string :url
      t.string :slug

      t.timestamps
    end
    add_index :us, :slug
  end
end

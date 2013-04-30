class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :body
      t.string :kind
      t.boolean :hide

      t.timestamps
    end
  end
end

class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.boolean :placeholder

      t.timestamps
    end
  end
end

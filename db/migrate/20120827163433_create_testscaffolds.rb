class CreateTestscaffolds < ActiveRecord::Migration
  def change
    create_table :testscaffolds do |t|
      t.string :mystringxx
      t.text :mytextxx
      t.integer :myintegerxx
      t.float :myfloatxx
      t.decimal :mydecimalxx
      t.datetime :mydatetimexx
      t.timestamp :mytimestampxx
      t.time :mytimexx
      t.date :mydatexx
      t.binary :mybinaryxx
      t.boolean :mybooleanxx
      t.references :myreferencesxx

      t.timestamps
    end
    add_index :testscaffolds, :myreferencesxx_id
  end
end

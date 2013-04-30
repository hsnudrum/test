class CreateFilterAnalytics < ActiveRecord::Migration
  def change
    create_table :filter_analytics do |t|
      t.string :password
      t.string :filter_name

      t.timestamps
    end
  end
end

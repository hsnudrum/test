class AddEmailToContactFeewise < ActiveRecord::Migration
  def change
    add_column :contact_feewises, :email, :string
  end
end

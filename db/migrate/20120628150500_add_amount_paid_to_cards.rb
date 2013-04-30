class AddAmountPaidToCards < ActiveRecord::Migration
  def change
    add_column :cards, :amount_paid, :string
  end
end

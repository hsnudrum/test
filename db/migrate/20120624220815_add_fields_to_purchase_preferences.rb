class AddFieldsToPurchasePreferences < ActiveRecord::Migration
  def change
    add_column :purchase_preferences, :buying        , :boolean
    add_column :purchase_preferences, :buy_where     , :string
    add_column :purchase_preferences, :buy_when      , :string
    add_column :purchase_preferences, :selling       , :boolean
    add_column :purchase_preferences, :selling_where , :string
    add_column :purchase_preferences, :selling_when  , :string
    add_column :purchase_preferences, :purchase_low  , :string
    add_column :purchase_preferences, :purchase_high , :string
    add_column :purchase_preferences, :sell_low      , :string
    add_column :purchase_preferences, :sell_high     , :string
    add_column :purchase_preferences, :body          , :text
  end
end

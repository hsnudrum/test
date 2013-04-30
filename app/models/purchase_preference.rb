class PurchasePreference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :daytime_phone, :location, :max_price, :min_price, :time_frame
  attr_accessible :buying, :selling, :buy_where, :buy_when, :selling_where, :selling_when, :purchase_low, :purchase_high, :sell_low, :sell_high, :body
  # validates_presence_of :daytime_phone
end

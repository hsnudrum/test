class DiscountCode < ActiveRecord::Base
  attr_accessible :code, :expiration, :price
  validates_uniqueness_of :code
  validates_presence_of :code
  validates_presence_of :expiration
  validates_presence_of :price
end

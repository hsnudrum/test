class U < ActiveRecord::Base
  attr_accessible :name, :note, :slug, :url
  extend FriendlyId
  friendly_id :name, :use => :slugged
  validates :name, :uniqueness => { :case_sensitive => false }
end

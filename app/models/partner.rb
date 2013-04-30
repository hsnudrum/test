class Partner < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :list_name, :user_id
  belongs_to :user

  before_create :subscribe_to_mailchimp_subscriptions

  def subscribe_to_mailchimp_subscriptions
    mc = MailChimpMailer.subscribe("Your home search savings leader",self.email,self.first_name, self.last_name)
debugger
    Rails.logger.warn "** Subscribe #{self.email}to mailchimp status #{mc}"
    raise "error" if mc.class != TrueClass
  end

end

class Subscription < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  validates_presence_of :email
  validates_uniqueness_of :email

  after_create :send_presales_customer_enquiry, :subscribe_to_mailchimp_subscriptions

private
# todo: do the email when it is time to debug
  def send_presales_customer_enquiry
    UserMailer.presales_customer_enquiry( self.email ).deliver
  end

  def subscribe_to_mailchimp_subscriptions
    Rails.logger.warn "** Subscribe #{self.email}to mailchimp status #{MailChimpMailer.subscribe("Your home search savings leader",self.email,self.first_name, self.last_name)}"
  end

end

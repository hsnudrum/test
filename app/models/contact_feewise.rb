class ContactFeewise < ActiveRecord::Base
  attr_accessible :body, :cc, :label, :subject, :to, :user_id, :email
  belongs_to :user
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i,
                 :allow_blank => true,
                 :allow_nil => true

  after_create :send_presales_customer_enquiry

  def send_presales_customer_enquiry
    UserMailer.presales_customer_enquiry( self.email ).deliver
  end

  def email
    return_value = self[:email]
    return_value = self.user.email unless (self.user.nil? or
                                           self.user.email.blank?)
    return_value
  end
end

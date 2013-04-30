class Card < ActiveRecord::Base
  belongs_to :user
  attr_accessible :day_phone, :email, :paid, :stripe_card_token
  attr_accessible :cardholder_name, :billing_address, :city, :postal_code, :state
  attr_accessible :discount_code
  attr_accessor :bliggino
  attr_reader :email

  validates_presence_of :cardholder_name, :on => :create, :message => "can't be blank"
  validates_presence_of :billing_address, :on => :create, :message => "can't be blank"
  validates_presence_of :city, :on => :create, :message => "can't be blank"

  # validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  # validates_uniqueness_of :email

  before_save :update_paid_attribute

  after_create :send_registration_confirmation

  def save_with_payment(discount_code)
    # need to be in process of buying session[:feewise_inproc_buying]
    # return false if !valid?  # may be  messing things up
    begin
      if valid? && !self.paid
        # amount_with_discount =  amount(discount_code)
        # amount in pennies
        amount_with_discount = (!discount_code.blank?) ? (discount_code.price * 100).to_f : 9900

        @stripe_charge = Stripe::Charge.create(:amount => amount_with_discount.to_i,    # 9900 defaults
                                               :currency => "usd",
                                               :card => stripe_card_token,
                                               :description => ">>> FeeWise FeeWise FeeWise FeeWise FeeWise FeeWise <<<" )

        # TODO: code where @stripe_charge comes back with bad info
        # self.stripe_card_token = @stripe_charge
        if @stripe_charge.failure_message.blank?
          self.paid = true
          self.amount_paid = amount_with_discount
          answer = save!
          logger.info "Results of Saving the Card are: #{answer}"
        else
          logger.error( "Stripe error while creating customer: #{e.message} " )
          errors.add( :base, "There was a problem with your credit card. " + @stripe_charge.failure_message)
          return false
        end
      end
    rescue Stripe::InvalidRequestError => e
      logger.error( "Stripe error while creating customer: #{e.message} " )
      errors.add( :base, "There was a problem with your credit card." )
      false
    end
  end

  def update_paid_attribute
    if @stripe_charge.present? && @stripe_charge.failure_message.blank?   # Used to indicate charge went through
      self.paid = true
    end
  end

  def send_registration_confirmation
    UserMailer.customer_registration_confirmation( self.user ).deliver
  end

  def email
    user.email
  end

  # def amount(discount)    # Defaults 99 dollars
  #   9900 if discount.blank?
  #   determine(discount)
  # end

  def self.calc_discount_code_arrays()
    d = Date.today.end_of_month + 31.days
    costs = (%w[0 1 10 19 29 39 49 59 69 79 89]).map{|s| s.to_f * 100}
    clear_codes = costs.map{|c| "Price:: $" + (c / 100).to_s + " Expires:: " + d.to_s}
    opaque_codes = costs.map{|cc| cc.to_s.crypt("Fe")}
    return costs, opaque_codes, clear_codes
  end

  #   def determine(discount)
  #     costs, opaque_codes, clear_codes = Card.calc_discount_code_arrays()
  #     t = [costs, opaque_codes].transpose
  #     return 9900 if t.blank? || (t.rassoc discount).blank?
  #     (t.rassoc discount).first
  #   end

  def self.discounts
    costs, opaque_codes, clear_codes = Card.calc_discount_code_arrays()
    t = [opaque_codes, clear_codes].transpose
  end

end

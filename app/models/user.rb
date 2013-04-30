class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :password
  validates :terms_of_service, :acceptance => true


  after_create :send_welcome_email

  # , :confirmable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :agree, :buying, :terms_of_service
  # attr_accessible :title, :body

  has_one :account, :dependent => :destroy
  has_one :purchase_preference, :dependent => :destroy
  has_one :card, :dependent => :destroy
  has_one :team, :dependent => :destroy
  has_many :contact_feewises
  has_many :partners, :dependent => :destroy

  before_save :create_account, :create_purchase_preference, :create_team

  # scope :published, lambda { where('published_at IS NOT NULL AND published_at <= ?', Time.zone.now) }
  # scope :recent, lambda { published.order(:published_at) }

  def create_account  # Rename account checklist
    self.account = Account.new if self.account.blank?
    self.account.save
  end

  def create_purchase_preference
    self.purchase_preference = PurchasePreference.new if self.purchase_preference.blank?
    self.purchase_preference.save
  end

  def create_team
    self.team = Team.new if self.team.blank?
    self.team.save
  end

  def steps
    # new_account_path|sign up             _path|                       _path|         _path|  static _path| show  _path|
    %w[new_account_path, new_user_registration_path new_purchase_preference_path  new_card_path thank_you_path account_path]
  end

  def id_with_card_token #feewise_id
    "unpaid"
    id.to_s + card.stripe_card_token.to_s if id && card && card.stripe_card_token
  end

  def paid?
    card && card.paid
  end

  private

    def send_welcome_email
      UserMailer.welcome_email(self).deliver
    end

end

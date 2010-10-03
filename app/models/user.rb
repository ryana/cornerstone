# Based on
# http://blog.bitzesty.com/mongodb-with-mongomapper-and-ruby-on-rails

class User
  include MongoMapper::Document
  devise :database_authenticatable, :confirmable, :trackable, :registerable, :recoverable, :rememberable

  key :first_name, String
  key :last_name, String
  key :email,  String
  key :username,  String
  key :encrypted_password, String
  key :password_salt, String
  key :reset_password_token, String
  key :remember_token, String
  key :remember_created_at, Time
  key :sign_in_count, Integer
  key :current_sign_in_at, Time
  key :current_sign_in_ip, String  

  timestamps!

  RegEmailName   = '[\w\.%\+\-]+'
  RegDomainHead  = '(?:[A-Z0-9\-]+\.)+'
  RegDomainTLD   = '(?:[A-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  RegEmailOk     = /\A#{RegEmailName}@#{RegDomainHead}#{RegDomainTLD}\z/i

  validates_length_of :email, :within => 6..100, :allow_blank => true
  validates_format_of :email, :with => RegEmailOk, :allow_blank => true
 
  attr_accessor :cc_subscription
  def setup_subscription(cc)
    if cc[:first_name].blank? || cc[:last_name].blank? || cc[:number].blank? ||
         cc[:year].blank? || cc[:month].blank?
      self.cc_subscription = nil
      return false
    end

    self.cc_subscription = Chargify::Subscription.create(
      :product_handle => Harmony[:chargify][:product_handle],
      :customer_attributes => {
        :first_name   => cc[:first_name],
        :last_name    => cc[:last_name],
        :email        => email,
        :reference    => id.to_s},
      :credit_card_attributes => {
        :full_number => cc[:number],
        :expiration_month => cc[:month],
        :expiration_year => cc[:year],
        :cvv => cc[:cvv]
      }
    )

    return cc_subscription.valid?
  end

  def subscription
    @subscription ||= Chargify::Customer.find_by_customer_reference(id.to_s)
  end

end

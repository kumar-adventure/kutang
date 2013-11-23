class User < ActiveRecord::Base
  attr_accessible :admin, :email, :password_digest, :password, :password_confirmation, :name, :phone, :address, :nickname, :contact_person, :skype_id, :token
  attr_accessible :terms, :information

  has_secure_password

  has_many :orders
  has_many :adverts
  has_many :promotes, through: :adverts

  #validates_presence_of :password, :on=> :create
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :email, presence: true

  validates :terms, acceptance: { accept: true, on: :create}



  validates_uniqueness_of :email
#  validates_format_of :phone, :with => /^([0-9]{3})+\-([0-9]{3})+\-([0-9]{4})$/i  if :phone
#  attr_accessor :current_password

  before_create :generate_token

  def generate_token
    begin
      uid = SecureRandom.hex(16)
    end while User.where(:token => uid).exists?
    self.token = uid
  end



end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :validatable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :zipcode, :home_value, :mortgage_balance, :street, :state, :city, :name, :email, :phone
  attr_accessible :password
  
  validates :zipcode, presence: true
  validates_format_of :zipcode, :with => /^\d{5}(-\d{4})?$/, :message => "Please enter a correct zipcode"

  validates :home_value, presence: true
  validates :mortgage_balance, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  validates :phone, presence: true, :numericality => { :only_integer => true },  :length => { :is => 10 }

  validates :name, presence: true  
 
end

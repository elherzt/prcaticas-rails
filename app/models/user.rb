class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
   #:token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :omniauthable
  before_save :ensure_authentication_token
  #
  has_many :cars

  #has_secure_password
end

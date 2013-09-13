class User < ActiveRecord::Base
before_save :ensure_authentication_token
  has_many :cars

  has_secure_password
end

class User < ActiveRecord::Base
	has_secure_password

#------------------------------------------------------------
# Callbacks
#------------------------------------------------------------
  before_save :create_remember_token
  before_save { |user| user.email = user.email.downcase }


#------------------------------------------------------------
# Validations
#------------------------------------------------------------
	validates :username, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
															  uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true


#------------------------------------------------------------
# Attributes
#------------------------------------------------------------
  attr_accessible :email, :password, :username, :password_confirmation



#------------------------------------------------------------
# Methods
#------------------------------------------------------------

  private

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end


end

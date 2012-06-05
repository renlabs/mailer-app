class User < ActiveRecord::Base
	has_secure_password
	validates :password, :presence => :true, length: {minimum:6}
	validates :password_confirmation, :presence => :true

  attr_accessible :email, :password, :username, :password_confirmation

end

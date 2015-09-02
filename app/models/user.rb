class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password

	def cart_count
	  $redis.scard "cart#{id}"
	end	
end

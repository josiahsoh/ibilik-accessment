class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, presence: true, uniqueness: true
	 
	has_secure_password
	has_many :properties
	has_many :comments
end

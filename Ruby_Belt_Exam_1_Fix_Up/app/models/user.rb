class User < ActiveRecord::Base
  	has_one :playlist
  	has_many :songs, through: :playlists
  	has_secure_password
#################################################
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :email, :password, :password_confirmation, presence:true
	validates :first_name, :last_name, length: {minimum: 2}
	validates :email, :password, length: {minimum: 4}
	validates :email, uniqueness:{case_sensitive:false}, format: {with:EMAIL_REGEX}
end

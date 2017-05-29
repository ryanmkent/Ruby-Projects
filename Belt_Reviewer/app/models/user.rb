class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :attendees
  has_many :events, through: :attendees #through?
  has_many :comments
  ###################################################
  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :location, :state, :password, :password_confirmation, presence:true 
	validates :email, :password, length: {minimum: 4}
	validates :first_name, :last_name, length: {minimum:2}
	validates :email, uniqueness:{case_sensitive:false}, format: {with:EMAIL_REGEX}
  validates :location, length: {minimum: 2}
	validates :state, length: {is: 2}
end
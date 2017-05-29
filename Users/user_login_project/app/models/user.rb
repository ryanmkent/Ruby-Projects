class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/
	validates :first_name, :last_name, :email_address, :age, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :age, numericality: { greater_than_or_equal_to: 10, less_than: 150}
end

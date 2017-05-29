class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  has_many :comments
  ##################################################
  validates :name, :date, :location, :state, presence:true
  validates :name, :location, length: {minimum: 2}
  validates :state, length: {is: 2}
end

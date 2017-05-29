class Song < ActiveRecord::Base
	belongs_to :playlist
	belongs_to :user
###############################################
	validates :title, :artist, presence:true
  	validates :title, :artist, length: {minimum: 1}
end

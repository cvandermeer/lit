class Team < ActiveRecord::Base

	### RELATIONS ###
	has_many :memberships
	has_many :users, through: :memberships

	### VALIDATIONS ###
	validates :name, presence: true
	
	## UPLOADER ##
  mount_uploader :picture, ImageUploader
end

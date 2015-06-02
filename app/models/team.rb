class Team < ActiveRecord::Base

	### RELATIONS ###
	has_many :memberships
	has_many :users, through: :memberships
	belongs_to :user

	### VALIDATIONS ###
	validates :name, presence: true
	validates :user_id, presence: true
	
	## UPLOADER ##
  mount_uploader :picture, ImageUploader
end

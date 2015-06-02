class Membership < ActiveRecord::Base

	### RELATIONS ###
	belongs_to :team
	belongs_to :user

	### VALIDATIONS ###
	validates :user_id, presence: true
	validates :team_id, presence: true
end

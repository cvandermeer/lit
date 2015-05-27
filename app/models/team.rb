class Team < ActiveRecord::Base

	### RELATIONS ###
	has_many :memberships
	has_many :users, through: :memberships
end

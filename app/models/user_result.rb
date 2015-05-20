class UserResult < ActiveRecord::Base
	### CALLBACKS ###
	belongs_to :category
	belongs_to :user
	belongs_to :language
end

class Category < ActiveRecord::Base

	### RELATIONS ###
	belongs_to :question
end

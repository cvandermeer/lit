class Category < ActiveRecord::Base

	### RELATIONS ###
	has_many :questions
end

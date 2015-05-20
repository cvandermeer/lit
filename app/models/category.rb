class Category < ActiveRecord::Base

	### RELATIONS ###
	has_many :questions
	has_many :user_results
end

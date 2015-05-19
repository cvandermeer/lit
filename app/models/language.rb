class Language < ActiveRecord::Base

	### RELATIONS ###
	has_many :questions
end

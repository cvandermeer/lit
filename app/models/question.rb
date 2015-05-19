class Question < ActiveRecord::Base

	### RELATIONS ###
	has_one :language
	has_one :category

	### VALIDATIONS ###
	validates :title, presence: true
	validates :category_id, presence: true
	validates :language_id, presence: true
	validates :answer, presence: true
end

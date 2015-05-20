class Question < ActiveRecord::Base

	### RELATIONS ###
	belongs_to :category
	belongs_to :language
  belongs_to :user

	### VALIDATIONS ###
	validates :title, presence: true
	validates :category_id, presence: true
	validates :language_id, presence: true
	validates :answer, presence: true
end

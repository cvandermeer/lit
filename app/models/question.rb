class Question < ActiveRecord::Base

	### CALLBACKS ###
	before_create :question_defaults

	### RELATIONS ###
	belongs_to :category
	belongs_to :language

	### VALIDATIONS ###
	validates :title, presence: true
	validates :category_id, presence: true
	validates :language_id, presence: true
	validates :answer, presence: true

	def question_defaults
		self.approved = 0
	end
end

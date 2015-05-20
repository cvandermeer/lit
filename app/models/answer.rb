class Answer < ActiveRecord::Base

	### RELATIONS ###
	belongs_to :question

	### VALIDATIONS ###
	validates :title, presence: true

end

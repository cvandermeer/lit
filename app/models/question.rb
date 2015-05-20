class Question < ActiveRecord::Base

	### CALLBACKS ###
	before_create :question_defaults

	### RELATIONS ###
	belongs_to :user 
	belongs_to :category
	belongs_to :language
	has_many :answers, dependent: :destroy

	### CALLBACKS ###
	after_create :set_correct_answer

	accepts_nested_attributes_for :answers, allow_destroy: true

	### VALIDATIONS ###
	validates :title, presence: true
	validates :category_id, presence: true
	validates :language_id, presence: true
	validate :require_two_answers

	def question_defaults
		self.approved = 0
	end

	def set_correct_answer
		self.update_attributes(correct_answer_id: self.answers.first.id)
		self.save
	end

	

  private
    def require_two_answers
      errors.add(:base, "Geef minstens twee antwoorden") if self.answers.size < 2
    end
end

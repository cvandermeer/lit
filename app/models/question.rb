class Question < ActiveRecord::Base

	### CALLBACKS ###
	before_create :question_defaults

	### RELATIONS ###
	belongs_to :user
	belongs_to :category
	belongs_to :language
	has_many :answers, dependent: :destroy

	### DELEGATE ###
	delegate :title, to: :category, prefix: true
	delegate :title, to: :language, prefix: true
	
	### CALLBACKS ###
	after_create :set_correct_answer

	accepts_nested_attributes_for :answers,:reject_if => :all_blank, allow_destroy: true

	### VALIDATIONS ###
	validates :category_id, presence: true
	validates :language_id, presence: true
	validate :add_least_one_is_present
	validate :require_two_answers

	def question_defaults
		self.approved = 0
	end

	def set_correct_answer
		self.update_attributes(correct_answer_id: self.answers.first.id)
		self.save
	end

	### UPLOADER ###
  mount_uploader :image, ImageUploader

  ### METHODS ###
  def user_points
  	self.user.points = self.user.points + 10
  	self.user.save
  end

  def self.get_back_one_random_question(val)
  	where(val, approved: true).offset(rand(Question.where(val, approved: true).count)).first
  end

  private
		def add_least_one_is_present
    	if category_id != 3
    		if title.blank?
    			errors.add(:base, "Voeg op zijn minst een afbeelding en title toe!")
    		end
    	elsif image.blank?
    		errors.add(:base, "Voeg een afbeelding toe!")
    	end
    end

		def require_two_answers
	  	if category_id != 3
				errors.add(:base, "Geef minstens twee antwoorden") if self.answers.size < 2
			elsif self.answers.size == 0
     		errors.add(:base, "Geef het woord dat bij de afbeelding hoort")
     	end
    end

end

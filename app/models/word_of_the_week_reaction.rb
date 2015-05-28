class WordOfTheWeekReaction < ActiveRecord::Base
  ### RELATIONS ###
  belongs_to :word_of_the_week
  belongs_to :user

  ### VALIDATIONS ###
  validates :title, presence: true
end

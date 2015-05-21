class WordOfTheWeekReaction < ActiveRecord::Base
  ### RELATIONS ###
  belongs_to :word_of_the_week

  ### VALIDATIONS ###
  validates :title, presence: true
end

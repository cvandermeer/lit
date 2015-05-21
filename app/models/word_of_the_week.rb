class WordOfTheWeek < ActiveRecord::Base
  ### RELATIONS ###
  has_many :word_of_the_week_reactions

  validates :title, presence: true
end

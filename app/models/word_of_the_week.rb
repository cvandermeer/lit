class WordOfTheWeek < ActiveRecord::Base
  ### RELATIONS ###
  has_many :word_of_the_week_reactions

  ### VALIDATIONS ###
  validates :title, presence: true

  ### METHODS ###
  def self.get_back_this_week
  	find(Time.now.strftime("%U").to_i + 1)
  end
end
